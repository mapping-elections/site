---
title: Maps
permalink: '/maps/'
layout: maps-browse
bodyclass: maps-browse
---

### Maps

<div data-equalizer data-equalize-on="medium" class="large-up-4">

{% assign groups = site.maps | group_by: "congressordinal" | sort: "congressnum" %}

{% for group in groups %}
<div class="medium-3 column column-block">
<h5>{{ group.name }} Congress</h5>
<ul>
{% assign items = group.items | sort: 'state' %}
{% for item in items %}
{% if item.level=='national' %}
<li>[{{'National'}}]({{site.url}}{{item.url}})</li>
{% elsif item.level=='state' %}
<li>[{{item.state}}{% if item.geography == 'town' %} (town){% endif %}]({{site.url}}{{item.url}}){% endif %}</li>
{%endfor%}
</ul>
</div>
{%endfor%}

</div>


