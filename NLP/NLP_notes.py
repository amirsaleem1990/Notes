
# coding: utf-8

# <img src="images_for_notebook/Libraries and tools.bmp">
# # Sentiment Classification
# <img src = "images_for_notebook/Sentiment_classification.bmp", width = 400, height = 400>
# #### it tries to predict the probability of review been a positive one given the features that we gave that model at paticuler review, the features is vector of tfitf values, you can find a weight of any feature of that BOW representation, you can multiply each tfitf value by that weight, then sum all fo that things, and pass it through sigmoid activation function, thats hwo to get logistice regression model.
# #### the weights that we get after the training can be interpreted.
# <img src="images_for_notebook/training_weights_using_logistic_regression.bmp", height = 400, width = 400>
# #### yahan modle ny jo weights nikaly hen wo us ki learning from our training data h, predefine ko information model k paas nahi thi
# # Let's try to add 2-grams
# <img src="images_for_notebook/with_2_grams.bmp", height = 400, width = 400>
# <img src="images_for_notebook/image5.png", height = 400, width = 400>
# # How to make results even better
# <img src="images_for_notebook/image6.png", width = 400, height = 400>

# # python TF-IDF example

# In[ ]:


from sklearn.feature_extraction.text import TfidfVectorizer
import pandas as pd
texts = ['good movie', 'not a good movie', 'did not like', 'i like it', 'good one']
tfidf = TfidfVectorizer(min_df=2, max_df = 0.5, ngram_range=(1,2))
features = tfidf.fit_transform(texts)
pd.DataFrame(features.todense(), columns=tfidf.get_feature_names())


# # deffirent Tokenize ways

# In[ ]:


text = "This is Andrew's text, isn't it?"

from nltk.tokenize import WordPunctTokenizer
tokenizer = WordPunctTokenizer()
tokens = tokenizer.tokenize(text)
print(len(tokens), '\n', tokens)


# In[ ]:


from nltk.tokenize import TreebankWordTokenizer
# uses gramer rules of english lanugage to make a tokenization 
# is actualy make sence for further analysis, and it is very close
# to perfect tokenization we want for english language 
tokenizer = TreebankWordTokenizer()
tokens = tokenizer.tokenize(text)
print(len(tokens), '\n', tokens)


# In[ ]:


tokens = text.split(' ')
print(len(tokens), '\n', tokens)


# # Token normalization
# <img src="images_for_notebook/image7.png", height = 400, width = 400>
# ### stemming example
# <img src="images_for_notebook/image8.png", height = 400, width = 400>
# <img src="images_for_notebook/image11.png", width = 400, height = 400>
# ### Lemmatization example
# <img src="images_for_notebook/image9.png", height = 400, width = 400>
# ### Further normalization
# <img src="images_for_notebook/image12.png", width = 400, height = 400>
# ### Note: we try both <font color='red'>Stemming</font> and <font color='red'>Lemmitization</font> and decide which work best
# # Hashing

# In[ ]:


from IPython.lib.display import YouTubeVideo
YouTubeVideo('xo9Vsfzfg8g', width=600, height = 400)


# # Vowpal Wabbit
# <img src="images_for_notebook/image18.png", width = 800, height = 400>
# # Naeural networks for text
# ## word2vec 
# ### pretrained embeddings, it is done unsupervised meners.
# ### words that have similar context tend to have collinear vectors
# <img src="images_for_notebook/image19.png", width = 400, height = 300>
# # *You can just average pre-grained word2vec vectors for your text
# # *You can do better with 1D convolutions that learn more complex features
# # 1D Convolutions
# <img src="images_for_notebook/image20.png", width = 400, height = 300>
# <img src="images_for_notebook/image21.png", width = 400, height = 300>
# <img src="images_for_notebook/image22.png", width = 400, height = 300>
# # 1D convolutions on chracters
# <img src="images_for_notebook/image24.png", width = 400, height = 300>
# <img src="images_for_notebook/image25.png", width = 400, height = 300>
# <img src="images_for_notebook/image26.png", width = 400, height = 300>
# # Max pooling
# <img src="images_for_notebook/image27.png", width = 400, height = 300>
# <img src="images_for_notebook/image28.png", width = 400, height = 300>
# <img src="images_for_notebook/image29.png", width = 400, height = 300>
# <img src="images_for_notebook/image30.png", width = 400, height = 300>
# # Deep models work better for large datasets
# ### Experimental datasets
# <img src="images_for_notebook/image31.png", width = 400, height = 300>
# <img src="images_for_notebook/image32.png", width = 400, height = 300>
# # Summary:
# ### You can use convolutional networks on top of characters (called learning from scratch)
# ### it works for large datasets where it beats classical approached (like BOW)
# ### Sometimes it even beats LSTM that works on word level
# # <h1><center><font size="10"><font color='red'>WEEK 2</font></font></h1></center>
# ## Sequence lebeling
# <img src="images_for_notebook/image33.png", width = 400, height = 300>
# ## PoS tags from Universal Dependencies project
# <img src="images_for_notebook/image34.png", width = 400, height = 300>
# ## Approaches to sequence labeling
# <img src="images_for_notebook/image35.png", width = 400, height = 300>
# ### Pos tagging with HMMs
# <img src="images_for_notebook/image36.png", width = 400, height = 300>
# <img src="images_for_notebook/image37.png", width = 400, height = 300>
# ### Text generation in HMM: an example
# <img src="images_for_notebook/image38.png", width = 400, height = 300>
# # Cook your own Language Model
# <img src="images_for_notebook/image39.png", width = 400, height = 300>
# # <h1><center><font size="10"><font color='red'>WEEK 3</font></font></h1></center>
# # Word2vec and doc2vec
# <img src="images_for_notebook/image40.png", width = 400, height = 300>
# ### Word2vec works some times, but not always.
# # Topic modeling
# ## Libraries for topic modeling
# <img src="images_for_notebook/image41.png", width = 400, height = 300>
# ## Topic visulization
# # textvis.lnu.se
# ### this website contains 380 ways to visulize topics
# <img src="images_for_notebook/image42.png", width = 400, height = 300>
# # <h1><center><font size="10"><font color='red'>WEEK 4</font></font></h1></center>
# # Summarization
# <img src="images_for_notebook/image43.png", width = 400, height = 300>
# <img src="images_for_notebook/image44.png", width = 400, height = 300>
# # Simplification
# <img src="images_for_notebook/image45.png", width = 400, height = 300>
# <img src="images_for_notebook/image46.png", width = 400, height = 300>
# <img src="images_for_notebook/image47.png", width = 400, height = 300>
# 
