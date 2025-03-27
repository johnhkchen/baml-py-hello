// Defining a data model.
class CoreTechnicalSkill {
  domain string
  specification string
  keywords string[]
  quintessential_skill string
}

class IndustryDomainKnowledge {
  area string
  specification string
  significance string
}

class PreparationStrategy {
  focus string
  bad_outcome string
  average_outcome string
  good_outcome string
}

class PreparationQuestion {
  subject string
  interviewer_goal string[]
  sample_questions string[]
  required_tech string[]
  metrics string[]
}

class TechnicalInterviewQuestion {
  subject string
  specific_skill string
  interview_goal string
  challenge_method string
  challenge_question string
}

class InterviewConsiderations {
  completeness int
  hiring_company string
  coreSkills CoreTechnicalSkill[]
  inudstryKnowledge IndustryDomainKnowledge[]
  behavioralSkills string[]
  special_terms string[] @description("The keywords that would boost a resume to the top of the interview pile, and provide an edge for applicants")
  questions PreparationQuestion[] @description("About 3 major interview subjects; a comprehensive overview of interview questions")
  technical_interview_challenge_methods string[]
  problemSolvingTopics string[]
  preparationStrategies PreparationStrategy[]
}

// Create a function to extract the resume from a string.
function ConsiderInterviewQuestions(job_description: string) -> InterviewConsiderations {
  // Specify a client as provider/model-name
  // you can use custom LLM params with a custom client name from clients.baml like "client CustomHaiku"
  client "openai/gpt-4o-mini" // Set OPENAI_API_KEY to use this client.
  prompt #"
    Extract from this content:
    {{ job_description }}

    {{ ctx.output_format }}
  "#
}

test claythis_engineer {
  functions [ConsiderInterviewQuestions]
  args {
    job_description #"
      About Claythis

      Claythis is a VC-backed startup building our proprietary GenAI model that creates 3D assets 1,000x faster and cheaper. We believe the world can be enriched by having more 3D-powered stories because humans naturally see, think, and communicate in 3D context. However, the existing 3D creation workflow is complex, expensive, and time-consuming, requiring steep expertise and effort. With the advent GenAI, we are on the brink of transforming the entire 3D workflow from end to end. At Claythis, we tackle highly technical and complex problems at the intersection of AI and 3D graphics. Led by a proven founder team—including a serial entrepreneur with 2x exits, a PhD from UC Berkeley, a technical advisor with deep expertise in ML/AI. 


      This is an incredible opportunity to join us as our very first hire—employee #1—and play a pivotal role by making a direct impact on the future of the company. 


      Responsibilities

      As an early member of the team, you’ll have full ownership and autonomy to:

          Design and build end-to-end AI products, from backend infrastructure and APIs to user-facing front-end interfaces.
          Train and deploy ML models for our 3D GenAI pipeline.
          Develop and deploy applications leveraging 2D diffusion models and 3D GenAI models.
          Optimize and integrate open-source tools for the 3D workflow, including modeling, posing, rigging, animating, and rendering.
          Collaborate with researchers and designers to prototype and implement new AI models, features, and UIs for mobile and web.
          Integrate third-party SDKs and add-ons to enhance functionality.
          Build scalable systems using cloud platforms such as AWS.


      Requirements

          3+ years of experience in full-stack engineering with a focus on AI/ML (e.g. Diffusion Model), ideally in gaming, animation, or film production.
          Hands-on expertise with AI frameworks and libraries such as TensorFlow, PyTorch, and OpenCV.
          Strong foundation in full-stack development, including front-end frameworks (e.g., React) and back-end technologies (e.g., Node.js).
          Familiarity with cloud platforms (AWS, Google Cloud, Azure) and containerization tools (e.g., Docker, Kubernetes).
          In-depth understanding of database systems (SQL, NoSQL) and experience with big data technologies.
          Knowledge of CI/CD processes and tools for seamless deployment and iteration.
          Proven experience shipping and maintaining full-stack AI projects.
          A strong passion for games, animation, or movies and a desire to redefine interactive entertainment.
          A startup mindset—ready to learn fast, fail fast, and iterate.
          Flexibility to work non-traditional hours and thrive in a fast-paced, ambiguous environment.
          You must have valid work authorization to work in the United States (e.g., U.S. citizenship or permanent residency).


      Preferred Qualifications

          Prior experience in a VC-backed pre-seed or seed stage startup.
          An MS or Ph.D. in Computer Science or a related technical field.
          Publications in top-tier conferences such as CVPR, SIGGRAPH, NeurIPS, ICCV, or ECCV.
          Expertise in explicit and/or implicit 3D representations (e.g., NeRF, Gaussian Splatting).


      Why Join Us?

      This isn’t just another job—it’s a chance to leave your mark on the future of 3D storytelling. As employee #1, you’ll trade the comfort of 9-to-5 work-life balance for unparalleled impact and ownership. If the idea of building something transformative from the ground up excites you, we want to hear from you. Let’s redefine the future of 3D creation together.

    "#
  }
}

test swish_robotics_engineer {
  functions [ConsiderInterviewQuestions]
  args {
    job_description #"
      

      Who We Are

      Here at Swish Robotics, we’re bringing embodied intelligence into the home—starting with Bento, an AI-powered cooking robot that prepares fresh meals in under 20 minutes. Backed by top investors, we are assembling a world-class team to build intelligent consumer robots that transform everyday life.


      We're looking for a Founding Software Engineer to architect and develop the software stack that powers our robots. This is an opportunity to own the software foundation of a category-defining product, working alongside the founding team to take Bento from prototype to mass production.


      The Role

      As the Founding Software Engineer, you will lead the design and development of Bento's software stack, including its real-time control, embedded systems, and AI-driven user experience. You'll be responsible for core system architecture, companion app development, firmware development, cloud connectivity, and user interface integration—playing a pivotal role in shaping both the technical and strategic direction of Swish Robotics.


      What You'll Do

      - Own Embedded Systems Software Stack – Design and implement the system architecture for robot control, embedded computing, and cloud connectivity.

      - Develop Real-Time Control Systems – Write firmware to control motors, sensors, and actuators on ESP32 and Raspberry Pi 5.

      - Integrate AI & Computer Vision – Work with onboard AI models for object recognition, sensor fusion, and real-time decision-making.

      - Build a Dynamic UI & User Experience – Develop a custom UI for the robot using PyQt5 and manage app-to-robot communication.

      - Optimize Performance & Reliability – Ensure the system is fast, responsive, and robust, even in constrained environments.

      - Cloud & IoT Integration – Enable remote monitoring, OTA updates, and real-time feedback from the Bento robot.

      - Establish Best Practices – Define coding standards, DevOps pipelines, and system monitoring tools for long-term scalability.


      Who You Are


      Required Qualifications:

      - Experience in software engineering, embedded systems, or robotics.

      - Expertise in Python, C++, or Rust for real-time and embedded applications.

      - Experience developing software for robotics, automation, or real-time control systems.

      - Familiarity with hardware communication protocols (UART, SPI, I2C, gRPC, MQTT, WebSockets).

      - Experience with Linux-based embedded systems (Raspberry Pi, Jetson, etc.).

      - Ability to architect full-stack solutions integrating firmware, edge computing, and cloud services.

      - Passionate about building consumer hardware and making robotics accessible to everyday users.


      Bonus:

      - Experience with computer vision, speech recognition, or reinforcement learning

      - Solid foundation in AWS (EC2, Lambda, S3, IoT Core, etc.)


      Why Join Us?

          Build Something Revolutionary – Be at the forefront of consumer robotics and embodied AI.
          High Ownership & Impact – Your work will directly shape the future of Swish.
          Equity – Meaningful equity in one of the fastest-growing robotics companies.
          First 5 Employees – Help define the culture, vision, and technical foundation of our company.
          Fast Execution – We move quickly, break things, and learn fast.
          It’s a Grind (But Worth It) – We're building ambitious hardware, which means long hours, high standards, and constant problem-solving. It’s not easy—but if you’re wired for this, there’s nowhere more exciting to be.

 
    "#
  }
}

test falconer_backend {
  functions [ConsiderInterviewQuestions]
  args {
    job_description #"
      

At Falconer, we’re transforming how engineers create, access, and share knowledge. We’re looking for a Founding Backend / Infrastructure Engineer to help us build an AI-powered knowledge platform that companies love.


As a founding engineer, you won’t just help shape our product development—you’ll have a seat at the table to define Falconer’s technical direction and culture.


Key responsibilities:


    Participate in the entire product development lifecycle, including architecture, coding, testing, and deploying
    Research and apply best practices in terms of infra, deployment, and containerization of our products and ML stack
    Develop and maintain backend systems including API services, databases, and server-side logic
    Optimize applications for maximum speed and scalability
    Write clean, efficient, and well-documented code, following industry best practices—the Falconer platform will help you!
    Stay updated with emerging technologies in web development and make recommendations for adopting new tools and practices


Who you are:


    Degree in Computer Science, Engineering or a related field, or equivalent work experience
    Minimum of 3 years of experience in developing APIs or backend systems in different languages (we'll gravitate towards Python and Node.js)
    You can evaluate trade-offs and propose the most appropriate storage solution (SQL, NoSQL, Vector DBs)
    You have experience with event queues such as Kafka or RabbitMQ
    You make containers look simple, and are the go-to person to discuss Docker or Kubernetes
    You can make anything run in AWS or Google Cloud
    You enjoy hard problems and open-ended assignments
    You use data to make decisions, and experiment your way around hard problems


Bonus points:


    You've developed products with LLMs before (extra if you've already built your own agents)
    You're familiar with vector databases and similarity search


Perks and benefits:


    Generous equity package
    Competitive salary and benefits
    401(k) retirement account
    The best equipment and tools, like a spec'd out MacBook, and dev prod tools like Cursor, Claude, and Linear to help you move fast
    Flexible work arrangements with in-office work or hybrid/remote work for the right candidate
    Our current office is in San Mateo, just steps from Caltrain


Falconer was founded by the former Head of Docs at Stripe and Uber, and an AI/ML tech lead from Uber and Meta. We are venture-backed, with a phenomenal founding team and strong customer demand.
 
    "#
  }
}

test retool_swe {
  functions [ConsiderInterviewQuestions]
  args {
    job_description #"
      

ABOUT RETOOL

Nearly every company in the world runs on custom software: Gartner estimates that up to 50% of all code is written for internal use. This is the operational software for refunding orders, underwriting loans, onboarding employees, analyzing transactions, and providing customer support. But most companies don’t have adequate resources to properly invest in these tools, leading to a lot of old and clunky internal software or, even worse, users still stuck in manual and spreadsheet flows.


At Retool, we’re on a mission to bring good software to everyone. We’re building a new type of development platform that combines the benefits of traditional software development with a drag-and-drop UI editor and AI, making it dramatically faster to build internal tools. We believe that the future of software development lies in abstracting away the tedious and repetitive tasks developers waste time on, while creating reusable components that act as a force multiplier for future developers and projects. The result is not just productivity, but good software by default. And that’s a mission worth striving for.


Today, our customers span from small startups building their first operational tools to Fortune 500 companies building mission-critical apps for thousands of users across their business. Interested in joining us? Let us know!


WHY WE'RE LOOKING FOR YOU

Retool started as a way to address obstacles with internal tools and has grown into a company that solves internal tooling for thousands of companies (big and small). We’ve done a lot with a little–we have a growing engineering team and a laundry list of features and foundational improvements we want to tackle.

To continue our fast-paced growth, we need to build a world-class engineering team. You’ll help us get there by owning end-to-end projects, talking with customers, and ultimately supporting the growth of Retool the product and the business.


WHAT YOU'LL DO 

We’re a tool built by engineers for engineers. You will work on features that impact thousands of customers globally and have the ability to change how applications are built across all parts of the stack. You’ll meet with internal counterparts to enhance customer thinking and partner closely with product on building out features. You’ll have a large impact on new features or improve performance on thousands of customers' applications.

Retool is built primarily in JavaScript and TypeScript, Node.js on the backend, and React on the frontend. We’ll look to you to bring your experience to build within this environment and impact our codebase. You’ll also engage in technical decision-making with the team, participate in planning, and help our engineering team expand its skillset. To that end, you’ll also play a key role in helping us grow the team through interviewing potential new team members.


WHO YOU'LL WORK WITH

As an engineer, you will work closely with product and design teams to build, ship, and iterate new features. We’re a hard-working, passionate bunch who are motivated by collaboration, strong results, and bringing the impact of Retool to our customers. When we’re in the office, we enjoy eating lunch (and occasionally dinner!) together, and we’ve been known for our lively game nights. But at the root of it all, we come together to show our customers and not-quite-yet customers how Retool can make them and their companies more efficient and successful. If this sounds like a fit, we’d love to hear from you!


IN THIS ROLE YOU'LL

    Improve the UX of the Retool core editor, which involves plenty of interesting problems, both technical (e.g. "how do we implement our drag and drop system in a performant way?") and otherwise (e.g. "how do we handle the pushing of existing components when dragging new components on?")
    Expand the types of applications that you can build into different parts of the development process
    Debug customer problems + build features for them (e.g. "the Google Sheets integration doesn't support adding rows", and "what's the best way to support that? Via cell ranges, or via a lightweight, home-grown ORM?")
    Help assess and recruit future engineers
    Work on increasing the scalability of Retool’s platform (e.g. frontend application performance, reducing query latencies)


THE SKILLSET YOU'LL BRING

    6+ years experience in professional software development, ideally some of which you’ve spent in startups
    Experience owning technically challenging and demanding cross-functional projects
    Experience across the entire stack, from backend to frontend (and if you have a preference, we’d love to hear it!)
    Experience with cloud based infrastructure like Azure, AWS or GCP
    Ability to make technical decisions quickly, while looping in key stakeholders, too
    A customer-first mindset and an interest in talking with customers to make sure what we’re building meets their needs
    Habit of introspection and understanding what’s helped you be successful in the past


NICE TO HAVE

    Experience in JavaScript / TypeScript
    Experience with PostgreSQL
    Bonus points if you have experience in mentoring other team members, and have previously worked closely with designers


For candidates based in San Francisco, the pay range(s) for this role is listed below and represents base salary range for non-commissionable roles or on-target earnings (OTE) for commissionable roles. This salary range may be inclusive of several career levels at Retool and will be narrowed during the interview process based on a number of factors such as (but not limited to), scope and responsibilities, the candidate’s experience and qualifications, and location.


Additional compensation in the form(s) of equity, and/or commission/bonuses are dependent on the position offered. Retool provides a comprehensive benefit plan, including medical, dental, vision, and 401(k). Pay and benefits are subject to change at any time, consistent with the terms of any applicable compensation or benefit plans.

San Francisco

$136,000—$216,800 USD


Retool offers generous benefits to all employees and hybrid work location. For more information, please visit the benefits and perks section of our careers page!

Retool is currently set up to employ all roles in the US and specific roles in the UK. To find roles that can be employed in the UK, please refer to our careers page and review the indicated locations.
 
    "#
  }
}
test stub_test_01 {
  functions [ConsiderInterviewQuestions]
  args {
    job_description #"
      About 
    "#
  }
}
