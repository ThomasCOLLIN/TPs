using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientBugTrack
{
    class Program
    {
        static void Main(string[] args)
        {
            BusinessManagement.BugTrack.GetListBugWithEF(10)
                .ForEach(bug => Console.WriteLine(bug.title));

            Console.ReadLine();
        }
    }
}
