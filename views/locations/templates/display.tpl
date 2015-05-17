{# views/sectors/templates/display.tpl #}
	{%extends "layout.tpl" %}

{% block title %}
	Emplacements
{% endblock %}
	
{% block header %}
	Emplacements
{% endblock %}

{% block content %}
	
	<form method="post" ACTION="/Cas-M-Ping/locations/add">
	<button type="submit" > Ajout d'un emplacement </button>
	</form>

	<form method="post" ACTION="/Cas-M-Ping/locations/delete/all">
	<button type="submit" > Suppression des emplacements </button>
	</form>	
	
	<table class="table">
		<tr>
			<th> Numéro d'emplacement </th>
			<th> Secteur </th>
			<th> Prix </th>
		</tr>
	{% for location in locations %}
		<tr>
			<td>{{location.loc_id}}</td>
			<td>{{location.sec_name}}</td>
			<td>{{location.type_location_price}}</td>
			<td>{{location.type_location_name}}</td>
			<td>
			<form method="post" ACTION="/Cas-M-Ping/locations/delete/{{loc_id}}">
			<button type="submit" > Supprimer </button>
			</form>	
			</td>
		</tr>
	{% endfor %}
	
{% endblock %}