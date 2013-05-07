using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;


namespace lemett_aBugTrack.DataAccess
{
    public class BugReport
    {
        public static string GenerateReportBug(DBO.BugReport bugReport)
        {
            string folder = HttpContext.Current.Server.MapPath("download");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string filename = folder + "/" + new Guid().ToString() + ".docx";

            using (WordprocessingDocument package = WordprocessingDocument.Create(filename, WordprocessingDocumentType.Document))
            {
                package.AddMainDocumentPart();

                package.MainDocumentPart.Document =
                    new Document(
                        new Body(
                            new Paragraph[] {
                                new Paragraph(
                                    new Run(
                                        new Text("Rapport de bug"))),
                                new Paragraph(
                                    new Run(
                                        new OpenXmlElement[] {
                                            new Text("Titre : " + bugReport.Title),
                                            new Break(),
                                            new Text("Personne responsable : " + bugReport.Responsable),
                                            new Break(),
                                            new Text("Statut : " + bugReport.Statut)})),
                                new Paragraph(CreateCommentsRun(bugReport))}));

                package.MainDocumentPart.Document.Save();
            }


            return filename;
        }

        private static Run CreateCommentsRun(DBO.BugReport report)
        {
            Run run = new Run();
            run.AppendChild(new Text("commentaires :"));
            run.AppendChild(new Break());

            foreach (string com in report.Comments)
            {
                run.AppendChild(new Text(com));
                run.AppendChild(new Break());
            }

            return run;
        }
    }
}