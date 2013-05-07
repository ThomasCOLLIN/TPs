using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBO
{
    public class Bug
    {
        private string _title;
        private string _projectName;
        private string _details;
        private DateTime _creationDate;

        public DateTime CreationDate
        {
            get { return _creationDate; }
            set { _creationDate = value; }
        }

        public string Details
        {
            get { return _details; }
            set { _details = value; }
        }

        public string ProjectName
        {
            get { return _projectName; }
            set { _projectName = value; }
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public Bug()
        {
            _title = "";
            _projectName = "";
            _details = "";
            _creationDate = new DateTime();
        }
    }
}