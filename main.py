from fasthtml.common import *
from baml_client.sync_client import b
from baml_client.types import InterviewConsiderations
from pydantic import BaseModel

class JobListing(BaseModel):
    description: str
    
def extract_interview_thoughts(listing: JobListing) -> InterviewConsiderations: 
  response = b.ConsiderInterviewQuestions(listing.description)
  return response

app, rt = fast_app()

interview_data = [{
      "completeness": 85,
      "hiring_company": "Silo",
      "coreSkills": [
        {
          "domain": "Software Engineering",
          "specification": "Back-end Development",
          "keywords": [
            "server-side logic",
            "APIs",
            "efficiency",
            "Go",
            "Postgres"
          ],
          "quintessential_skill": "Back-end software development in Go"
        }
      ],
      "inudstryKnowledge": [],
      "behavioralSkills": [
        "Self-motivation",
        "Team collaboration",
        "Initiative taking",
        "Adaptability in a fast-paced environment"
      ],
      "special_terms": [
        "high-availability software",
        "REST API",
        "GraphQL",
        "Postgres optimization",
        "Kubernetes"
      ],
      "questions": [
        {
          "subject": "Back-end Development in Go",
          "interviewer_goal": [
            "Assess understanding of server-side programming",
            "Evaluate problem-solving ability with algorithms",
            "Test knowledge of database interactions"
          ],
          "sample_questions": [
            "Can you explain how you would handle a request in a RESTful API built with Go?",
            "What strategies do you employ to optimize database queries in Postgres?",
            "Describe your experience with building scalable systems."
          ],
          "required_tech": [
            "Go",
            "Postgres",
            "AWS",
            "Kubernetes"
          ],
          "metrics": [
            "Performance",
            "Responsiveness",
            "Scalability"
          ]
        }
      ],
      "technical_interview_challenge_methods": [
        "Live coding exercise on Go",
        "System design problem involving database architecture",
        "Optimization task on SQL query performance"
      ],
      "problemSolvingTopics": [
        "Data structures and algorithms",
        "API design and integration",
        "Database performance tuning"
      ],
      "preparationStrategies": [
        {
          "focus": "Hands-on practice with Go and Postgres",
          "bad_outcome": "Inability to complete coding tasks",
          "average_outcome": "Able to complete coding tasks with assistance",
          "good_outcome": "Efficiently completes coding tasks and optimizations independently"
        }
      ]
    }
    ]


@app.get("/")
def home():
    data = interview_data[-1]
    
    
    # Minimal custom styles
    custom_styles = Style("""
        .badge {
            display: inline-block;
            padding: 0.2rem 0.6rem;
            margin: 0.2rem;
            border-radius: 1rem;
            background-color: var(--primary-focus);
            color: var(--primary-inverse);
            font-size: 0.8rem;
        }
        
        .progress-container {
            background-color: var(--card-sectionning-background);
            border-radius: 0.5rem;
            margin: 1rem 0;
        }
        
        .progress-bar {
            height: 0.5rem;
            border-radius: 0.5rem;
            background-color: var(--primary);
        }
        
        article.summary {
            padding: 1rem;
            border-radius: var(--border-radius);
            background-color: var(--card-sectionning-background);
            margin-bottom: 1rem;
        }
        
        article header.accent {
            border-bottom: 2px solid var(--primary);
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
        }
        
        .key-highlight {
            font-weight: bold;
            color: var(--primary);
        }
        
        .keywords-cell {
            display: flex;
            flex-wrap: wrap;
            gap: 0.2rem;
        }
    """)
    
    # Helper functions
    def create_badges(keywords):
        return [Small(keyword, cls="badge") for keyword in keywords]
    
    def create_list_items(items):
        return [Li(item) for item in items]
    
    def create_progress_bar(value):
        return Div(
            Div(style=f"width: {value}%", cls="progress-bar"),
            cls="progress-container"
        )
    
    # Company header with completeness
    header = Article(
        Header(
            H1(data["hiring_company"]),
            cls="accent"
        ),
        P(Mark(f"Interview Profile Completeness: {data['completeness']}%")),
        create_progress_bar(data["completeness"])
    )
    
    # Core skills section - Using definition lists
    if data["coreSkills"]:
        skills_content = [Header(H2("Core Skills"), cls="accent")]
        
        for skill in data["coreSkills"]:
            skill_card = Article(
                Header(H3(skill["domain"])),
                Dl(
                    Dt("Specialization:"),
                    Dd(skill["specification"]),
                    Dt("Quintessential Skill:"),
                    Dd(Mark(skill["quintessential_skill"])),
                    Dt("Key Skills:"),
                    Dd(Div(*create_badges(skill["keywords"]), cls="keywords-cell"))
                ),
                cls="summary"
            )
            skills_content.append(skill_card)
    else:
        skills_content = [
            Header(H2("Core Skills"), cls="accent"),
            P("No core skills specified.")
        ]
    
    core_skills_section = Article(*skills_content)
    
    # Industry knowledge section
    if data["inudstryKnowledge"]:
        knowledge_content = [Header(H2("Industry Knowledge"), cls="accent")]
        
        for knowledge in data["inudstryKnowledge"]:
            knowledge_card = Article(
                H3(knowledge["area"]),
                Dl(
                    Dt("Specification:"),
                    Dd(knowledge["specification"]),
                    Dt("Significance:"),
                    Dd(Mark(knowledge["significance"]))
                ),
                cls="summary"
            )
            knowledge_content.append(knowledge_card)
    else:
        knowledge_content = [
            Header(H2("Industry Knowledge"), cls="accent"),
            P("No industry knowledge specified.")
        ]
    
    industry_knowledge_section = Article(*knowledge_content)
    
    # Behavioral skills section - Using Group for horizontal display
    if data["behavioralSkills"]:
        behavioral_content = [
            Header(H2("Behavioral Skills"), cls="accent"),
            Group(
                *[Button(skill, role="button", cls="outline") for skill in data["behavioralSkills"]]
            )
        ]
    else:
        behavioral_content = [
            Header(H2("Behavioral Skills"), cls="accent"),
            P("No behavioral skills specified.")
        ]
    
    behavioral_skills_section = Article(*behavioral_content)
    
    # Special terms section - Using badges with a descriptive intro
    if data["special_terms"]:
        special_terms_content = [
            Header(H2("Special Terms & Keywords"), cls="accent"),
            P("These are key terms and concepts that may come up during the interview process:"),
            Div(*create_badges(data["special_terms"]))
        ]
    else:
        special_terms_content = [
            Header(H2("Special Terms & Keywords"), cls="accent"),
            P("No special terms specified.")
        ]
    
    special_terms_section = Article(*special_terms_content)
    
    # Interview questions section
    if data["questions"]:
        questions_content = [Header(H2("Interview Questions"), cls="accent")]
        
        for question in data["questions"]:
            question_card = Article(
                Header(H3(question["subject"])),
                Grid(
                    Div(
                        H4("Interviewer Goals:"),
                        Ul(*create_list_items(question["interviewer_goal"]))
                    ),
                    Div(
                        H4("Sample Questions:"),
                        Ul(*[Li(Mark(q)) for q in question["sample_questions"]])
                    )
                ),
                Div(
                    H4("Required Technologies:"),
                    Div(*create_badges(question["required_tech"]) if question["required_tech"] else P("None specified")),
                    H4("Success Metrics:"),
                    Ul(*create_list_items(question["metrics"]))
                ),
                cls="summary"
            )
            questions_content.append(question_card)
    else:
        questions_content = [
            Header(H2("Interview Questions"), cls="accent"),
            P("No interview questions specified.")
        ]
    
    questions_section = Article(*questions_content)
    
    # Technical interview methods
    if data["technical_interview_challenge_methods"]:
        tech_methods_content = [
            Header(H2("Technical Interview Methods"), cls="accent"),
            P("These are the formats you might encounter during the interview process:"),
            Details(
                Summary("View Technical Interview Methods"),
                Ul(*create_list_items(data["technical_interview_challenge_methods"]))
            )
        ]
    else:
        tech_methods_content = [
            Header(H2("Technical Interview Methods"), cls="accent"),
            P("No technical interview methods specified.")
        ]
    
    tech_interview_methods = Article(*tech_methods_content)
    
    # Problem solving topics section
    
    # Problem solving topics
    if data["problemSolvingTopics"]:
        problem_solving_content = [Div(
            H2("Problem Solving Topics", cls="section-title"),
            Ul(*create_list_items(data["problemSolvingTopics"]))
        )]
    else:
        problem_solving_content = [
            Header(H2("Problem Solving Topics"), cls="accent"),
            P("No problem solving topics specified.")
        ]
    
    problem_solving_section = Article(*problem_solving_content)
    
    # Preparation strategies
    if data["preparationStrategies"]:
        strategies_content = [Header(H2("Preparation Strategies"), cls="accent")]
        
        for strategy in data["preparationStrategies"]:
            strategy_card = Article(
                Header(H3(strategy["focus"]), cls="accent"),
                Grid(
                    Article(
                        Header(H4("Needs Improvement")),
                        P(strategy["bad_outcome"])
                    ),
                    Article(
                        Header(H4("Satisfactory")),
                        P(strategy["average_outcome"])
                    ),
                    Article(
                        Header(H4("Excellent")),
                        P(Ins(strategy["good_outcome"]))
                    )
                ),
                cls="summary"
            )
            strategies_content.append(strategy_card)
    else:
        strategies_content = [
            Header(H2("Preparation Strategies"), cls="accent"),
            P("No preparation strategies specified.")
        ]
    
    strategies_section = Article(*strategies_content)
    
    # Combine everything into a container
    content = Container(
        header,
        core_skills_section,
        industry_knowledge_section,
        behavioral_skills_section,
        special_terms_section,
        questions_section,
        tech_interview_methods,
        problem_solving_section,
        strategies_section
    )
    
    return Titled(
        f"{data['hiring_company']} Interview Dashboard",
        custom_styles,
        content
    )

@app.get("/add")
def add():
    return Main(P("Add a job description"),
                Form(Input(type="text", name="description"),
                     Button("Submit"),
                     action="/", method="post"))

@app.post("/")
def add_message(description: str):
  listing = JobListing(description=description)
  considerations = extract_interview_thoughts(listing)
  interview_data.append(considerations.dict())
  return home()

serve()