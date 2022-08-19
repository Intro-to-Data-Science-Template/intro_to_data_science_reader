---
pre: <b>1. </b>
title: Syllabus
weight: 1
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---



<script src="syllabus_files/libs/kePrint-0.0.1/kePrint.js"></script>
<link href="syllabus_files/libs/lightable-0.0.1/lightable.css" rel="stylesheet" />


-   [Course Description][]
-   [Course Structure][]
-   [Course Instructor][]
    -   [Contacting Me][]
-   [Course Policies][]
    -   [Required Materials][]
    -   [Attendance][]
    -   [Academic Honesty][]
    -   [Code of Conduct][]
    -   [Accommodation][]
-   [Grading][]
    -   [Standards Based Grading][]
    -   [Standards][]
    -   [Final Grades][]
    -   [Late Work Policy][]
-   [FAQ][]

## Course Description

Introduction to Data Science (SDS 192) aims to equip students with the knowledge and tools to understand, critically evaluate, manipulate, and explain data. This is an introductory course, and no prior experience is necessary.[^1] Students will learn how to read and write code, but also how to create, organize, and collaborate on coding projects while critically examining the projects goals and data sources. We will be primarily use the R language, along with supplemental tools.

## Course Structure

Each week will follow the same basic structure. Monday and Wednesday classes will include lectures to introduce new concepts. Lecture will be followed by interactive problem sets designed to reinforce those concepts through active learning. Slides from lecture will be posted online after the class. The problem sets for any class will be "due" at the start of next class period when the answers will be released; I expect most problem sets can be completed in class the day they are given out. These problem sets do not contribute toward your grade. They are intended to reinforce material and help you test your own understanding.

Friday classes will be devoted to lab activities or project work time. Students are expected to come to class to work on these activities. Labs will comprise of longer and more involved problem sets incorporating topics from the current and prior weeks. Students will work on labs in groups of two to four people. Labs will be reviewed through GitHub Classroom where feedback will be provided.

For a full list of assignments and due dates, please see the course [schedule][].

{{% notice info %}}
This is a 4-credit course, meaning that by federal guidelines, you should be spending 12 hours total per week on this course. That means you should be spending 8.25 hours (12 hours - 3.75 hours/week of in-class instruction) on this course per week outside of class.
{{% /notice %}}

## Course Instructor

![][1]

I am a sociologist that studies abuses of power in government. I earned my Ph.D. at the University of California, Davis in in sociology with a designated emphasis in computational social science. I combine computational methods such as social network analysis, natural language processing, geospatial analysis, and machine learning with open source and governmental data to uncover patterns of misfeasance and malfeasance by our public servants. From the political networks of politicians and prohibition gangsters to bias hidden in the text of academic recruitment, I use new methods to work on old problems of corruption and inequality.

At Smith College I am a visiting assistant professor in the Statistical & Data Sciences program. I have experience working with both United States and United Kingdom governmental organizations applying machine learning to real-world problems. In the UK I worked with the national lab for data science and machine learning, the Alan Turing Institute, on early detection systems in foster care to assure children were receiving adequate services. Meanwhile in the US I worked with the Internal Revenue Service to built a machine learning system that determined the credibility of incoming fraud reports.

### Contacting Me

{{< tabs >}}

{{% tab name="Slack" %}}

You can send me a message on the course <a href="https://smi-sds-192-03-202301.slack.com/">Slack workspace</a>, and I will respond when I am able, typically within 24 hours *during the work week*. To message me, click the **+** button next to "Direct Messages" and search for my name.

If your question is not sensitive in nature, consider putting it in the `#coding-help` or `#course-help` channel instead. There is a good chance one of your classmates will be able to answer before I can.

Slack questions should be brief or administrative in nature, for more in-depth questions and troubleshooting please attend office hours instead.

{{% /tab %}}
{{% tab name="Office Hours" %}}

You can schedule a meeting with me on <a href="https://calendly.com/jared-joseph/office-hours">Calendly</a>. You may also try to drop in, however priority will always be given to those who made an appointment. You are encouraged to set up group appointments if several people have a similar question.

If you are coming to office hours with a coding question, make sure you have the code ready *at the start of your appointment*. We don't want to spend the first several minutes waiting for your computer to boot up and getting your project open.

If you cannot find an open time slot, please message me for an appointment and I will attempt to find a time that works for both of us.

{{% /tab %}}

{{< /tabs >}}

## Course Policies

### Required Materials

Students are not expected to buy any materials for this course. Data science is built on free and open collaboration, and there is no shortage of high quality learning material available. This reader, as well as all assignments, will likewise be freely available for all into the foreseeable future.

Students are required to have a working computer (preferably a laptop) and reliable internet connection for this course. Any reasonably recent computer should be sufficient, with the notable exception of Chromebooks. Chromebooks lack access to the majority of the tools used by data scientists, and thus it will be difficult to complete course assignments with one.

{{% notice warning %}}
If you only have access to a Chromebook, please speak with me as soon as possible.
{{% /notice %}}

### Attendance

I will not be taking attendance in this course, and you do not need to inform me when you will be absent. **If you are sick, please stay home.** Given the standards based grading system (discussed below), no single class, assignment, or even quiz will negatively impact your grade. That said, I expect students to be present when possible. It will be very difficult to keep up with course material without consistent attendance.

If you miss a class, you should contact a peer to discuss what was missed, and check the course reader website for any upcoming deadlines. I won't have the capacity this semester to re-deliver missed material in office hours.

{{% notice info %}}
Quizzes cannot be made up after the open period has passed. If you have a known schedule conflict with a quiz, please speak with me as soon as possible to arrange an alternative.
{{% /notice %}}

### Academic Honesty

Data science is inherently collaborative, so I fully expect students to collaborate with each other. Ask questions on slack, create study groups, and share helpful resources you find. **The only avenue in which collaboration is not allowed is on quizzes.**

However, all work that you submit must be your own. All students, staff, and faculty are bound by the Smith College Honor Code, which Smith has had since 1944:

> Students and faculty at Smith are part of an academic community defined by its commitment to scholarship, which depends on scrupulous and attentive acknowledgement of all sources of information and honest and respectful use of college resources.<br><br>Smith College expects all students to be honest and committed to the principles of academic and intellectual integrity in their preparation and submission of course work and examinations. All submitted work of any kind must be the original work of the student who must cite all the sources used in its preparation.<br><br>
> <p style="text-align: right">
> -Smith Academic Honor Code
> </p>

Any cases of dishonesty or plagiarism will be reported to the Academic Honor Board. Examples of dishonesty or plagiarism include:

-   Submitting work completed by another student as your own.
-   Copying and pasting text *or code* from sources without quoting and citing the author.
-   Paraphrasing material from another source without citing the author.
-   Failing to cite your sources correctly.
-   Falsifying or misrepresenting information in submitted work.
-   Paying another student or service to complete assignments for you.

Learning to code is most similar to learning a new language; *you will only learn by doing*. No amount of rote copying will advance you beyond the most elementary levels of understanding. Please keep this in mind.

If someone else helps you understand a concept better, give them a nod in the `#shoutouts` channel on slack.

### Code of Conduct

> As participants in this course we are committed to making participation a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, ethnicity, age, or religion. Examples of unacceptable behavior by participants in this course include the use of sexual language or imagery, derogatory comments or personal attacks, trolling, public or private harassment, insults, or other unprofessional conduct.<br><br> As the instructor I have the right and responsibility to point out and stop behavior that is not aligned to this Code of Conduct. Participants who do not follow the Code of Conduct may be reprimanded for such behavior. Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the instructor.<br><br>All students and the instructor are expected to adhere to this Code of Conduct in all settings for this course: seminars, office hours, and over Slack.

This Code of Conduct is adapted from the [Contributor Covenant][].

### Accommodation

Smith College is committed to providing support services and reasonable accommodations to all students with disabilities. To request an accommodation, please register with the [Disability Services Office][] at the beginning of the semester.

## Grading

### Standards Based Grading

This course will be graded using a standards-based assessment system. This means that rather than assignments being graded based on the percentage of the questions you answered correctly, your responses will be compared against a pre-defined set of course standards and assigned a level of proficiency. You will have multiple opportunities over the course of the semester to showcase the depth of your understanding regarding these standards.

An important feature of standards based grading is how your understanding of a topic is totaled at the end of the semester. In traditional points style grading, an average is taken of all your assignments, and your final grade is represented by that average. This means all assignments are given equal consideration in your final grade.

<div class="columns">

<div class="column">

![][2]

</div>

<div class="column">

<p style="text-align: center;">
<span class="large">Mean of<br>A1-A5</span>
</p>

<i class="fas fa-arrow-right fa-6x"></i>

</div>

<div class="column">

![][3]

</div>

</div>

In contrast, standards-based grading is only interested in your understanding of the material at the end of the course. This means that only your highest level of demonstrated proficiency is tallied. Functionally this means that only your best score is kept; all others are effectively forgotten. This allows you to safely engage with complicated topics early on, and have opportunities to show improvement without penalization. This also means if you understand a concept early on, you do not need to worry about it for the remainder of the course.

<div class="columns">

<div class="column">

![][2]

</div>

<div class="column">

<p style="text-align: center;">
<span class="large">Max of<br>A1-A5</span>
</p>

<i class="fas fa-arrow-right fa-6x"></i>

</div>

<div class="column">

![][4]

</div>

</div>

A standards-based grading system carries a number of other benefits:

-   Learning targets for the course are clearly defined from the outset, and every graded assignment will be directly tied to at least one standard. This should make it abundantly clear what skills and competencies I'm assessing on every assignment. There is no "busy work" with a standards-based system.
-   No one assignment will make-or-break your grade. You have multiple opportunities to demonstrate fluency in a standard. This rewards students that take the time to practice and learn from their mistakes. It prioritizes student growth throughout the course of the semester.
-   Assessments in a standards-based system are much clearer than in a point-based grading system. Saying that I've become proficient in data wrangling, joining, and visualizing means more than saying that I earned a 92.5 in my Introduction to Data Science course.
-   A standards-based grading system makes it easier to monitor your progress towards a certain grade.
-   There is no competition and no curve in a standards based system; others doing well will never curve the overall grade against you. The only person you are ever compared with is your past self. Help each other often and freely.

### Standards

The following table lists all the standards you will be evaluated on in this course. There are 15 total standards, separated into 4 categories. Each standard states what conditions must be met to reach each proficiency level. There are four proficiency levels for each standard, each requiring more complete understanding of the material. These levels are inclusive, meaning to reach the 4th level, "Exceeds Standard" you must also meet all the requirements of level 3, "Meets Standard."

You will have multiple opportunities in the course to demonstrate your understanding of each standard. Any assignment that is reviewed is an opportunity to increase your proficiency level in a standard. In addition to the four levels of proficiency, there is also an extra point available in each standard called "Individual Standard." You may fulfill this requirement only quizzes, but only need to reach the "Meets Standard" criteria on a standard to do so.

{{% notice info %}}
You can demonstrate proficiency in any reviewed assignment, **but can only fulfill the "Individual Standard" criteria on a quiz.**
{{% /notice %}}

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Standard </th>
   <th style="text-align:left;"> Does Not Meet Standard </th>
   <th style="text-align:left;"> Progressing Toward Standard </th>
   <th style="text-align:left;"> Meets Standard </th>
   <th style="text-align:left;"> Exceeds Standard </th>
   <th style="text-align:left;"> Individual Standard </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #DECBE4 !important;border-right:1px solid;"> Data Importing </td>
   <td style="text-align:left;"> Cannot import data or uses R Studio visual tools to import data. </td>
   <td style="text-align:left;"> Manually organizes or modifies data before importing it into R. </td>
   <td style="text-align:left;"> Can import raw data into R using the appropriate function for the data source. </td>
   <td style="text-align:left;border-right:1px solid;"> Can interface with APIs or other remote sources and import data directly into R. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #DECBE4 !important;border-right:1px solid;"> Data Cleaning </td>
   <td style="text-align:left;"> Cleans data in a non-programmatic way. </td>
   <td style="text-align:left;"> Can clean data programmatically on a cell-by-cell basis to prepare it for analysis. </td>
   <td style="text-align:left;"> Can assign the correct common data types (logical, integer, numeric, factor, and string) to loaded data and understand the uses of each. Can clean data for analysis in a vectorized way. </td>
   <td style="text-align:left;border-right:1px solid;"> Can prepare data for advanced types (dates, time series, etc.). Can prepare data from non-traditional sources such as OCR or web scraping. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #DECBE4 !important;border-right:1px solid;"> Data Reshaping </td>
   <td style="text-align:left;"> Formats data in a non-programmatic way. </td>
   <td style="text-align:left;"> Can derive new measures from existing data and append it to dataframes. </td>
   <td style="text-align:left;"> Can pivot data between wide and long formats, and can explain the use case of each. </td>
   <td style="text-align:left;border-right:1px solid;"> Can transition data between data frames and lists, and explain the applications of data in a list format. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #DECBE4 !important;border-right:1px solid;"> Data Aggregation &amp; Subsetting </td>
   <td style="text-align:left;"> Transforms data in a non-programmatic way. </td>
   <td style="text-align:left;"> Creates multiple copies of data in several intermediate stages of transformation that are used for different steps of analysis. </td>
   <td style="text-align:left;"> Can combine and split data sets using the appropriate merge or subset techniques. </td>
   <td style="text-align:left;border-right:1px solid;"> Can split or merge data sets using either SQL-like calls or approximate matching. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #FBB4AE !important;border-right:1px solid;"> Functions </td>
   <td style="text-align:left;"> Copies-and-pastes similar code with small changes. </td>
   <td style="text-align:left;"> Creates simple functions with consistent inputs. </td>
   <td style="text-align:left;"> Creates simple functions that can handle novel inputs, with logic to handle the data appropriately. </td>
   <td style="text-align:left;border-right:1px solid;"> Creates complex functions that can handle arbitrary input. Includes built in error checking and warnings. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #FBB4AE !important;border-right:1px solid;"> Iteration </td>
   <td style="text-align:left;"> Copies-and-pastes similar code several times within or between scripts. </td>
   <td style="text-align:left;"> Uses for loops or apply functions to iterate through vector data to preform a single data manipulation. </td>
   <td style="text-align:left;"> Can use either loops or apply functions to iterate over a vector of data and preform multi-step manipulations. </td>
   <td style="text-align:left;border-right:1px solid;"> Can use loops or apply functions and explain the use cases for each. Can iterate over complex data structures such as dataframes or lists. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #B3CDE3 !important;border-right:1px solid;"> Visualization Structure </td>
   <td style="text-align:left;"> Selects inappropriate formats for data visualization. </td>
   <td style="text-align:left;"> Selects sub-optimal visualization formats or uses excessive visualizations where a single one would be sufficient. </td>
   <td style="text-align:left;"> Selects suitable formats for data visualization (bar, line, boxplot, etc.) and can explain the reasoning behind that choice. </td>
   <td style="text-align:left;border-right:1px solid;"> Effectively mixes visualization formats or isolates individual elements to clearly communicate a message. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #B3CDE3 !important;border-right:1px solid;"> Visualization Aesthetics </td>
   <td style="text-align:left;"> Chooses visual cues and colors for purely aesthetic reasons without attention to data representation. </td>
   <td style="text-align:left;"> Data visualizations attempt to represent underlying data, but use methods unsuited to the task which leave ambiguity for the viewer. </td>
   <td style="text-align:left;"> Data visualizations use color, scale, and shapes effectively to differentiate and communicate underlying data. </td>
   <td style="text-align:left;border-right:1px solid;"> Data visualizations are highly customized with bespoke elements, such as callouts, to clearly communicate the message of the visualization. Aesthetics are sensitive to accessibility concerns. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #B3CDE3 !important;border-right:1px solid;"> Visualization Context </td>
   <td style="text-align:left;"> Produces data visualizations that are unclear, confusing, devoid of context, or impossible to understand without reading the text. </td>
   <td style="text-align:left;"> Produces data visualizations with readable axis labels, units, and legends (where appropriate). </td>
   <td style="text-align:left;"> Produces data visualizations that are clear and understandable with minimal text captions. </td>
   <td style="text-align:left;border-right:1px solid;"> Produces data visualizations that are self-contained and can be understood on their own without textual explanation. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> Data Ethics </td>
   <td style="text-align:left;"> Does not consider data ethics or investigate data provenance. </td>
   <td style="text-align:left;"> Can articulate common pitfalls and relate them to the project at hand. Confirms data types and scales using data documentation. </td>
   <td style="text-align:left;"> Reads data documentation to understand data collection/generation and measurements. Can highlight potential concerns specific to the data or project. </td>
   <td style="text-align:left;border-right:1px solid;"> Either creates data documentation for used data, or includes notes in code to the data sources and explains potential pitfalls. Considers and articulates relevant concerns related to the current project unprompted throughout the work cycle. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> Code Style </td>
   <td style="text-align:left;"> Code style is inconsistent and/or lacks documentation. </td>
   <td style="text-align:left;"> Code comments explain the broad strokes of intended behavior. Indentation is consistent and predictable. Uses print statements to track the status of code execution. </td>
   <td style="text-align:left;"> Consistently comments all code with clearly organized sections. Expected inputs and outputs are clearly explained. Uses error messages or print statements within their code to locate the causes of errors and resolve them. </td>
   <td style="text-align:left;border-right:1px solid;"> Code is clearly commented, with standardized formatting and indentation. Code contains tests which will check for errors, and report those errors if they arise. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: #CCEBC5 !important;border-right:1px solid;"> Git/Github </td>
   <td style="text-align:left;"> Does not use git for version control. </td>
   <td style="text-align:left;"> Uses git and GitHub for version control and can contribute to group repositories with commits, pushes, and pulls. </td>
   <td style="text-align:left;"> Uses git and GitHub effectively. Code commits are of appropriate size and commented well. Can branch and merge repositories while resolving any merge conflicts. Does not include sensitive files in commits. </td>
   <td style="text-align:left;border-right:1px solid;"> Uses Github effectively for collaboration. Can create issues, ask for review, and merge branches in a manner suitable for a collaborative environment. </td>
   <td style="text-align:left;background-color: #A2CD5A !important;"> <i class="fas fa-check-square fa-2x" style="width: 100%; text-align: center;"></i> </td>
  </tr>
</tbody>
</table>

### Final Grades

Your completion of these standards will be converted into a final letter grade using the following process. Each of the 12 standards will be converted into a four point scale, with one point available for meeting the "Individual Standard" on a quiz.

-   1 Point. "Does Not Meet Standard"
-   2 Points. "Progressing Toward Standard"
-   3 Points. "Meets Standard"
-   4 Points. "Exceeds Standard"
-   +1 Point. "Individual Standard"

On this scale, there are 60 points total in the course (12 standards \* 5 possible points). I will sum the highest level of proficiency you reach in each standard over the course of the semester to arrive at your final score. For example, if someone were to reach "Exceeds Standard" in all standards, but could never do so on a quiz, they would receive 48 of 60 points (4 points \* 12 standards). Similarly, if someone reaches "Meets Standard" in all topics, including on quizzes, but did not exceed the standard in any topic, they would likewise receive 48 of 60 points.

The summed points will be converted into letter grades using the following table.

| Letter | Points |
|--------|--------|
| A      | 57-60  |
| A-     | 54-56  |
| B+     | 52-53  |
| B      | 50-51  |
| B-     | 48-49  |
| C+     | 46-47  |
| C      | 44-45  |
| C-     | 42-43  |
| D+     | 40-41  |
| D      | 38-39  |
| D-     | 36-37  |
| F      | 0-35   |

### Late Work Policy

Assignments turned in late will not be reviewed, and will not be considered for demonstrating proficiency in course standards. Keep in mind missing an assignment will not hurt your grade in any way, rather it simply removes one chance for you to demonstrate your knowledge of course material. If you do not think you will be able to turn in an assignment by the deadline, you may request an extension. To do so, please send me a message explaining why you are unable to complete the assignment in the expected time frame. **Extension requests must be made--and accepted--before the assignment due date.**

{{% notice info %}}
After the due date, late assignments will only be reviewed if there were *emergency* circumstances preventing you from turning the assignment in on time.
{{% /notice %}}

## FAQ

<div class="question">

Q: So if I reach "Exceeds Standard" and fulfill the individual standard on a quiz for a topic early in the semester, I can just skip those questions for the rest of the class?

A: Theoretically yes, but I would recommend you answer all questions to make sure you're not letting your knowledge slip.

</div>

[^1]: If this is your first course in the SDS department, you will also need to enroll in SDS 100.

  [Course Description]: #course-description
  [Course Structure]: #course-structure
  [Course Instructor]: #course-instructor
  [Contacting Me]: #contacting-me
  [Course Policies]: #course-policies
  [Required Materials]: #required-materials
  [Attendance]: #attendance
  [Academic Honesty]: #academic-honesty
  [Code of Conduct]: #code-of-conduct
  [Accommodation]: #accommodation
  [Grading]: #grading
  [Standards Based Grading]: #standards-based-grading
  [Standards]: #standards
  [Final Grades]: #final-grades
  [Late Work Policy]: #late-work-policy
  [FAQ]: #faq
  [schedule]: /intro_to_data_science_reader/#schedule
  [1]: https://filedn.com/l7C36orhaIP0u9d6RtOoEES/jnjoseph_headshot_live.jpg?classes=floatright,inline,headshot&featherlight=false "Dr. Jared Joseph"
  [Contributor Covenant]: https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/
  [Disability Services Office]: https://www.smith.edu/about-smith/disability-services
  [2]: assignments_plot.jpg?featherlight=false
  [3]: final_points.jpg?featherlight=false
  [4]: final_standards.jpg?featherlight=false
