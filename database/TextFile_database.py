from os.path import exists
from operator import contains

from hawkey import ValueException
from database import IDatabase

import io

class databaseOpenRequest:
    text_file_database : str
    invalid_link_database : str


class TextFileDatabase(IDatabase.IDatabase):

    def __init__(self) -> None:
        super().__init__()
        self.text_file_database=io.StringIO("")
        self.invalid_link_database=io.StringIO("")
        self.invalid_link_database.close()
        self.text_file_database.close()
    
    def open(self,database : databaseOpenRequest):
        if type(database) is not databaseOpenRequest:
            raise ValueError("Invalid database type")
        self.text_file_database = database.text_file_database
        self.invalid_link_database = database.invalid_link_database
        # check whether given database exit or not.
        if exists(self.text_file_database):
            self.text_file_database = open(self.text_file_database, "a+")
        else:
            open(self.text_file_database, "w+")

        if exists(self.invalid_link_database):
            self.invalid_link_database = open(self.invalid_link_database, "a+")
        else:
            open(self.invalid_link_database, "w+")

        return True

   
    def close(self):
        f1 = self.text_file_database
        f2 = self.invalid_link_database
        try:
            f1.close()
            f2.close()
            return True
        except:
            return False
   
    def isOpen(self):
        if not self.text_file_database.closed or not self.invalid_link_database.closed:
            return True

        else:
            return False
        
    def add_filePath(self,path):
        if not self.text_file_database.closed:
            self.text_file_database.write(path)
            return path
        else:
            raise RuntimeError("database is not open")


    def remove_filePath(self,path): ## and truncate
        """!
        Remove file path from database
        e.g. /s-zera-stor01/..../File1.docx

        contains_filePath will return false for this path and
        get_all_path will not list this path further.

        Furthermore all invlaid links assigned to this file will be deleted as well.

        @Param path  The absolute filepath

        @return unique id to indentify file path. Can be file path

        @throw RuntimeError if database is not open
        """
        pass


    def contains_filePath(self,path):
        """!
        Return true if path is stored in database

        @param path  The expected path 

        @return true if path was found false othwerwise

        @throw RuntimeError if database is not open
        """
        pass
    

    def get_all_Path(self):
        """!
        Return list with all stored path

        @return list() with all path

        @throw RuntimeError if database is not open
        """
        pass


    def add_invalidLink(self,path,link):
        """!
        Add invalid link to database
        The link is assigned to the file where it was foiund in.

        @param path  file that contains invlaid link
        @param link  the invalid link itself

        @return unique id to indentify link path. Can be link itself   

        @throw RuntimeError if database is not open    
        """
        pass


    def remove_invalidLink(self,path,link):
        """!
        Remove invalid link from database
        e.g. /s-zera-stor01/..../File1.docx

        contains_invlaidLInkwill return false for this link and file combination
        get_invalid_links will not list this further for this path.

        Furthermore all invlaid links assigned to this file will be deleted as well.

        @Param path  The file the contained the invlaid link
        e.g. /s-zera-stor01/..../File1.docx
        @Param link  The once invlaid link itself
        e.g. /s-zera-stor01/..../File2.docx

        @return unique id to indentify link path. Can be link itself
        e.g /s-zera-stor01/..../File2.docx

        @throw RuntimeError if database is not open
        """
        pass


    def contains_invalidLink(self,path,link):
        """!
        Return true if invalid link is stored for path in db

        @param path  The file that conatains the invalid link
        e.g. /s-zera-stor01/..../File1.docx

        @param link  The invalid link itself
        e.g /s-zera-stor01/..../File2.docx


        @return true if file (param path) has invalid link (param link) otherwise false

        @throw RuntimeError if database is not open
        """
        pass


    def get_invalid_links(self,path):
        """!
        Return list with all invalid links stored for file path

        @param path  path toi file that conatins invalid links

        @return list() with invlaid links contained in path

        @throw RuntimeError if database is not open
        """
        pass


    def get_all_invalid_links(self):
        """!
        Returns set with all invalid links found independet from file path 

        @return set() with all invalid links

        @throw RuntimeError if database is not open
        """
        pass


    def remove_all_occurence_of_invalid_link(self,link):
        """!
        Removes all occurences of an invlaid link from database

        Neither get_invalid_links nor get_all_invalid_links will return 
        this link after this function call

        @param the link to remove from the entire database
        e.g /s-zera-stor01/..../File2.docx
        
        @returns unique id of link. Can be link itself

        @throw RuntimeError if database is not open
        """
        pass