# base image
FROM python:3.10-slim
# slim here makes the image smaller, but you can use python:3.10 if you want a larger image with more libraries pre-installed

# set the working directory in the container to /app    
WORKDIR /code
# this will now be the starting directory in the comtainer

COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
# we use --no-cache-dir to avoid caching the packages as docker has its own caching
# this will install all the packages listed in the requirements.txt file

COPY ./src ./src
# copying all the code from the src directory in the project folder

# the entry command to run the app
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]