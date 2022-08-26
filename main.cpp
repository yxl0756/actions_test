#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <iostream>
#include <windows.h>

static time_t
get_compiler_time(char const *date_, char const *time_)
{
    char s_month[5];
    int year;
    struct tm t;
    const char month_names[] = "JanFebMarAprMayJunJulAugSepOctNovDec";
    sscanf(date_, "%s %d %d", s_month, &t.tm_mday, &year);
    sscanf(time_, "%2d %*c %2d %*c %2d", &t.tm_hour, &t.tm_min, &t.tm_sec);
    // Find where is s_month in month_names. Deduce month value.
    // Keep consistent with the time(NULL) function, do not +1 to the month
    t.tm_mon = (int)((strstr(month_names, s_month) - month_names) / 3);
    t.tm_year = year - 1900;
    t.tm_isdst = -1;
    return mktime(&t);
}

uint64_t
on_about_build_id(int zone)
{
    if (zone)
    {
        return get_compiler_time(__DATE__, __TIME__);
    }
    return (28800 + get_compiler_time(__DATE__, __TIME__));
}

int main()
{
    TIME_ZONE_INFORMATION tzi;
    GetTimeZoneInformation(&tzi);
    int zone = tzi.Bias/(-60);
    time_t t = on_about_build_id(zone);
    printf("build_time = %I64d, current_time = %I64d, zone = %d\n", t, time(NULL), zone);
    return 0;
}
