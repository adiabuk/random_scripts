<?php
$username = 'adiab@hotmail.co.uk';
$password = 'crap';
if(file_exists('../users/' . $username . '.xml')){
        print 'file exists<br>';
        
        $xml = new SimpleXMLElement('../users/' . $username . '.xml', 0, true);
    $ctid = $xml->from;
print "beg" . $ctid . "end<br>";

        if($password == $xml->password){
            print "password match";
            if ($xml->status == "suspended"){
                print 'This account has been suspended.';
                print "1";
            }
	    else
            {
                 print 'cool, no match';
             }
	}
        else
	{
	print "no password match";
	}
}
else
print 'file not found';

?>
