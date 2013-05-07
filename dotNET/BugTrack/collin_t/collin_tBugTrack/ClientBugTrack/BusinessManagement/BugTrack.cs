using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientBugTrack.BusinessManagement
{
    class BugTrack
    {
        public static List<ServiceReferenceBugTrack.T_Bug> GetListBugWithEF(int max)
        {
            return DataAccess.BugTrack.GetListBugWithEF(max);
        }
    }
}
