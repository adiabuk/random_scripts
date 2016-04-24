from selenium import selenium
import unittest, time, re

class create_acct(unittest.TestCase):
    def setUp(self):
        self.verificationErrors = []
        self.selenium = selenium("localhost", 4444, "*chrome", "http://www-stag.amroxonline.com/")
        self.selenium.start()
    
    def test_create_acct(self):
        sel = self.selenium
        sel.open("/create_account.php")
        sel.click("name=gender")
        sel.click("name=gender")
        sel.type("name=firstname", "Test1")
        sel.type("name=firstname", "Test1")
        sel.type("name=firstname", "First")
        sel.type("name=firstname", "First")
        sel.type("name=lastname", "Last")
        sel.type("name=lastname", "Last")
        sel.type("name=dob", "04/01/1982")
        sel.type("name=dob", "04/01/1982")
        sel.type("name=email_address", "test1@amroxservices.com")
        sel.type("name=email_address", "test1@amroxservices.com")
        sel.type("name=company", "Company")
        sel.type("name=company", "Company")
        sel.type("name=street_address", "8 Somestreet Close")
        sel.type("name=street_address", "8 Somestreet Close")
        sel.type("name=suburb", "Suburb")
        sel.type("name=suburb", "Suburb")
        sel.type("name=postcode", "FU2 FU2")
        sel.type("name=postcode", "FU2 FU2")
        sel.type("name=city", "Some City")
        sel.type("name=city", "Some City")
        sel.type("name=state", "Some State")
        sel.type("name=state", "Some State")
        sel.select("name=country", "label=United Kingdom")
        sel.select("name=country", "label=United Kingdom")
        sel.type("name=telephone", "01234567890")
        sel.type("name=telephone", "01234567890")
        sel.type("name=fax", "01234567898")
        sel.type("name=fax", "01234567898")
        sel.type("name=password", "password")
        sel.type("name=password", "password")
        sel.type("name=confirmation", "password")
        sel.type("name=confirmation", "password")
        sel.click("css=td > input[type=\"image\"]")
        sel.click("css=td > input[type=\"image\"]")
        sel.wait_for_page_to_load("30000")
    
    def tearDown(self):
        self.selenium.stop()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
