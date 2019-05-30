---
title: Maps
permalink: '/maps/'
layout: maps-browse
bodyclass: maps-browse
---

### U.S. Congressional Maps (1788-1825)

<div data-equalizer data-equalize-on="medium" class="large-up-4">

{% assign groups = site.maps | group_by: "congressordinal" | sort: "congressnum" %}

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

<div data-equalizer data-equalize-on="medium" class="large-up-4">

### Selected State Legislative Maps

- [Delaware House of Representatives, 1796](/maps/meae.staterepresentative.1796.de.county)
- [New Jersey General Assembly, 1800](/maps/meae.staterepresentative.1800.nj.county)
- [New Jersey General Assembly, 1801](/maps/meae.staterepresentative.1801.nj.county)
- [New Jersey General Assembly, 1802](/maps/meae.staterepresentative.1802.nj.county)
- [Pennsylvania House of Representatives, 1805](/maps/meae.staterepresentative.1805.pa.county)
- [Pennsylvania House of Representatives, 1806](/maps/meae.staterepresentative.1806.pa.county)
- [Maryland House of Delegates, 1808](/maps/meae.staterepresentative.1808.md.county)
- [Maryland House of Delegates, 1817](/maps/meae.staterepresentative.1817.md.county)
- [Maryland House of Delegates, 1818](/maps/meae.staterepresentative.1818.md.county)
- [Maryland House of Delegates, 1819](/maps/meae.staterepresentative.1819.md.county)
- [Maryland House of Delegates, 1820](/maps/meae.staterepresentative.1820.md.county)
- [Maryland House of Delegates, 1821](/maps/meae.staterepresentative.1821.md.county)
- [Maryland House of Delegates, 1822](/maps/meae.staterepresentative.1822.md.county)
</div>

