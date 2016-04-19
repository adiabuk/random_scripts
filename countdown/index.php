<?php
//////////////////////////////////////////////////////////////////////
//PARA: Date Should In YYYY-MM-DD Format
//RESULT FORMAT:
// '%y Year %m Month %d Day %h Hours %i Minute %s Seconds'        =>  1 Year 3 Month 14 Day 11 Hours 49 Minute 36 Seconds
// '%y Year %m Month %d Day'                                    =>  1 Year 3 Month 14 Days
// '%m Month %d Day'                                            =>  3 Month 14 Day
// '%d Day %h Hours'                                            =>  14 Day 11 Hours
// '%d Day'                                                        =>  14 Days
// '%h Hours %i Minute %s Seconds'                                =>  11 Hours 49 Minute 36 Seconds
// '%i Minute %s Seconds'                                        =>  49 Minute 36 Seconds
// '%h Hours                                                    =>  11 Hours
// '%a Days                                                        =>  468 Days
//////////////////////////////////////////////////////////////////////
function dateDifference($date_1 , $date_2 , $differenceFormat = '%a' )
{
    $datetime1 = date_create(strftime("%F %T"));
    $datetime2 = date_create($date_2);
    $interval = date_diff($datetime1, $datetime2);
    return $interval->format($differenceFormat) . "\r\n";

}
#phpinfo()
echo dateDifference('2015-06-10', '2015-09-30', 'Years:%Y,Months:%M,Days:%d,Hours:%H,Minutes:%i,Seconds:%s');
//echo dateDifference('2015-06-10', '2015-09-30', "%h Hours");
//echo dateDifference('2015-06-10', '2015-09-30', '%s Seconds');
?>
