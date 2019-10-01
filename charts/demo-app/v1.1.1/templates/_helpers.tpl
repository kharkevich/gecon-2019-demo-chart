{{/* vim: set filetype=mustache: */}}
{{/*
Create env list.
*/}}
{{- define "mysql.env" }}

- name: DATABASE_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.application.name }}-config
      key: mysql_host

- name: DATABASE_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.application.name }}-config
      key: mysql_port

- name: DATABASE_DB
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.application.name }}-config
      key: mysql_db

- name: DATABASE_LOGIN
  valueFrom:
    secretKeyRef:
      name: {{ .Values.application.name }}-mysql-credentials
      key: mysql_user
- name: DATABASE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.application.name }}-mysql-credentials
      key: mysql_password

-  { name: DATABASE_URL, value: "{{ printf "$(DATABASE_LOGIN):$(DATABASE_PASSWORD)@$(DATABASE_HOST):$(DATABASE_PORT)/$(DATABASE_DB)" }}"}
{{- end -}}
