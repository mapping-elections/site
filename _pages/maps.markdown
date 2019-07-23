---
title: Maps
permalink: '/maps/'
layout: maps-browse
bodyclass: maps-browse
---

### U.S. Congressional Maps (1788-1825)

<div data-equalizer data-equalize-on="medium" class="large-up-4">

{% assign groups = site.maps | where:"type","congressional" | group_by: "congressordinal" | sort: "congressnum" %}

{% for group in groups %}
<div class="medium-3 column column-block">
<h5>{{ group.name }} Congress</h5>
<ul>
{% assign items = group.items | sort: 'state' %}
{% for item in items %}
{% if item.level=='national' %}
<li class="national">[{{'National'}}]({{site.url}}{{item.url}})</li>
{% elsif item.level=='state' %}
<li>[{{item.state}}{% if item.geography == 'town' %} (town){% endif %}]({{site.url}}{{item.url}}){% endif %}</li>
{%endfor%}
</ul>
</div>
{%endfor%}

</div>

<div class="large-12 column">

### Selected State Legislative Maps

{% assign staterepmaps = site.maps | where:"type","state-rep" | sort: "year" %}
<ul>
{% for staterepmap in staterepmaps %}
<li>[{{staterepmap.title}}]({{site.url}}{{staterepmap.url}})</li>
{%endfor%}
</ul>
</div>

