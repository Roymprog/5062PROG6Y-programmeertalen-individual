import unittest
import individual

class TestPredict(unittest.TestCase):

    def testEmtpyList(self):
        empty_list = []
        self.assertFalse(individual.opgave1(empty_list))

    def testInvalidList(self):
        faulty_list = range(0,9)
        self.assertFalse(individual.opgave1(faulty_list))

    def testListDoesNotHaveAllIntegers(self):
        list_not_all_integers = [2,2,3]
        self.assertFalse(individual.opgave1(list_not_all_integers))

    def testValidList(self):
        valid_list = range(1,10)
        self.assertTrue(individual.opgave1(valid_list))

    def testRaiseIfNoList(self):
        no_list = 1
        with self.assertRaises(Exception) as context:
            individual.opgave1(no_list)

        self.assertTrue('This function should only be called with a list as parameter' in str(context.exception))

if __name__ == '__main__':
    unittest.main()