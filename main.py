

from baml_client.sync_client import b
from baml_client.types import Resume

def example(raw_resume: str) -> Resume: 
  # BAML's internal parser guarantees ExtractResume
  # to be always return a Resume type
  response = b.ExtractResume(raw_resume)
  return response

def main():
    print(example("I am the president of China! I am very powerful Winnie the Pooh!"))

if __name__ == "__main__":
    main()

