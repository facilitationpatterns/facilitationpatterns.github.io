---
layout: default
---
Each pattern describes a problem which occurs over and over again in our environment, and then describes the core of the solution to that problem, in such a way that you can use this solution a million times over, without ever doing it the same way twice. -- Christopher Alexander

What is Facilitation?
=====================

Facilitation comes from the latin _facile_, which mean _easy_. In fact, the role of a facilitator in a group setting is to "make things easy". It involves planning, organizing, and setting or supporting rules and goals within such groups. It is my goal here to collect and share many of the tricks, techniques and practices that facilitators use in their work.

Facilitation Patterns
=====================

Facilitation Patterns are then general reusable solutions to common facilitation problems. Take a look and let us know what you think!

The patterns I have collected here fall into these categories :

{% for category in site.card_categories %}
### {{ category }}
{% for card in site.cards | where: "category", category %}
  {% if card.category == category %}
  
  [{{ card.title }}]({{ card.url }})
  
  {% endif %}
{% endfor %}
{% endfor %}

