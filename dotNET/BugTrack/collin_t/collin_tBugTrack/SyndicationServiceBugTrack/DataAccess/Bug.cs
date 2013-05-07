using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SyndicationServiceBugTrack.DataAccess
{
    class Bug
    {
        public static List<DBO.Bug> GetLastBug(int max)
        {
            using (BugTrackEntities bdd = new BugTrackEntities())
            {
               List<T_Bug> bugs = bdd.T_Bug
                   .Include("T_Project")
                   .OrderByDescending(bug => bug.CreateDate)
                   .Take(max).ToList();

               List<DBO.Bug> result = new List<DBO.Bug>();

               foreach (T_Bug tbug in bugs)
               {
                   DBO.Bug bug = new DBO.Bug();
                   bug.Title = tbug.title;
                   bug.ProjectName = tbug.T_Project.name;
                   bug.Details = tbug.Description;
                   bug.CreationDate = tbug.CreateDate;

                   result.Add(bug);
               }

               return result;
            }
        }
    }
}
