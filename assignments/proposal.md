**1) Data Source**

<https://github.com/microsoft/CodeBERT/tree/master/CodeBERT/code2nl>

to download the data:

pip install gdown

mkdir data data/code2nl

cd data/code2nl

gdown <https://drive.google.com/uc?id=1rd2Tc6oUWBo7JouwexW3ksQ0PaOhUr6h>

unzip Cleaned_CodeSearchNet.zip

rm Cleaned_CodeSearchNet.zip

cd ../..

Data statistics:
PL	Training	Dev	Test
Python	251,820	13,914	14,918
PHP	241,241	12,982	14,014
Go	167,288	7,325	8,122
Java	164,923	5,183	10,955
JavaScript	58,025	3,885	3,291
Ruby	24,927	1,400	1,261

**2) Analysis Workflow**

Run the code to documentation pipeline.

Either:\
<https://github.com/microsoft/CodeBERT/tree/master/CodeBERT/code2nl>\
Or:\
<https://github.com/microsoft/CodeXGLUE/tree/main/Code-Text/code-to-text>

There is also another repo where a developer recreated the codebert code
themselves (this is specifically for code search though, whereas the
above is about automated code documentation. The code documentation is
also in the repo above from MSFT):\
<https://pythonawesome.com/codebert-a-pre-trained-model-for-programming-and-natural-languages/>

The basic flow is:

a\) data prepertion - take the raw data and clean it\
b) model refinement (take BERT model and train it on this new data\
c) test the model\
d) print out the results\
\
**3) Tools for implementing workflow**

This is a NLP workflow using python. The initial step is to take a
standard NLP model (BERT) and fine tune it for the particular task (code
documentation generation). The second step is to test the fine-tuned
model to gather some statistics. This definitely uses a GPU.

**4) possible performance optimization targets**

How can we leverage additional GPUs? Is that a way to scale? It looks
like the code already supports multiple GPUs.

I hope that initial benchmarking will also offer suggestions about where
the code is slow\
Maybe related to caching the data sets?

Try running on both \"Distributed memory\" and \"shared memory\".

Try running with more or less CPU, memory, or GPU.

I dont think it is possible to break down training by code language
(e.g. PHP vs Python) because there is a single model for all languages
normally. That\'s what the researchers did at least. But the single
model constrains the problem because the training is updating this model
- I dont think you can have multiple processes updating the model at the
same time. But maybe the test step could be parallelized (if that is
helpful) since the model is constant there.

There is a lot of data here so any way to chew through the data faster
is helpful. But again on the training side I am not sure if that is
possible given the common model.

Could try different parameterizations of the model to see which works
best (in parallel). E.g. eval steps,training and test batch size,
learning rate.

Maybe the data preperation can be parallelized into jobs? It is just
text manipulation. It might be so fast that it does not matter? To be
determined.
