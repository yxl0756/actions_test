#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdint.h>
#include <windows.h>

static time_t get_utc_time(int nDate, int nTime)
{
    struct tm tmOuter = { nTime%100, (nTime/100)%100, nTime/10000, nDate%100,(nDate/100)%100-1, nDate/10000-1900 };
#ifdef _WIN32  // Windows
    return _mkgmtime(&tmOuter);  
#else  // linux
    return timegm(&tmOuter); 
#endif
}

static time_t
get_compiler_time(char const *date_, char const *time_)
{
    struct tm t;
    char s_month[5];
    int year;
    const char month_names[] = "JanFebMarAprMayJunJulAugSepOctNovDec";
    sscanf(date_, "%s %d %d", s_month, &t.tm_mday, &year);
    sscanf(time_, "%2d %*c %2d %*c %2d", &t.tm_hour, &t.tm_min, &t.tm_sec);
    // Find where is s_month in month_names. Deduce month value.
    // Keep consistent with the time(NULL) function, do not +1 to the month
    t.tm_mon = (int)((strstr(month_names, s_month) - month_names) / 3);
    t.tm_year = year - 1900;
    t.tm_isdst = -1;
    return (_mkgmtime(&t));
}

uint64_t
on_about_build_id(void)
{
#ifndef ACTIONS_BUILDING
    int zone = 0;
    TIME_ZONE_INFORMATION tzi;
    GetTimeZoneInformation(&tzi);
    if ((zone = (int)tzi.Bias/60))
    {
        printf("If it is a local compilation, add this time offset, zone = %d\n", zone);
        return (zone * 3600 + get_compiler_time(__DATE__, __TIME__));
    }
#endif
    return get_compiler_time(__DATE__, __TIME__);
}

int main(void)
{
    char chunk[64] = {0};
    time_t t = on_about_build_id();
    printf("t = %zu\n", t);
    struct tm *p = gmtime(&t);
    printf("after gmtime, the time is: %d:%d:%d\n", p->tm_hour, p->tm_min, p->tm_sec);
    _snprintf(chunk, 64, "%d%02d%02d%02d%02d%02d", (1900+p->tm_year), (1+p->tm_mon),p->tm_mday, p->tm_hour, p->tm_min, p->tm_sec);
    int64_t t64 = _atoi64(chunk);
    printf("chunk = [%s], t64 = [%I64d]\n", chunk, t64);
    return 0;
}