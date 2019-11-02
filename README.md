This code returns the number of occurrences of most frequent words in a text file. For instance, if we take the bible as source text:

```ruby
most_common_words('source-text.txt', 'stop_words.txt', 3)
#=> { 'lord' => 8722, 'God' => 7380, 'Jesus' => 2617 }
```
