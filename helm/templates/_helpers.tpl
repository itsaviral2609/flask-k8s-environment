{{- define "flask-helm.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{ .Values.fullnameOverride }}
{{- else -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}
{{- end }}

{{- define "flask-helm.labels" -}}
app: flask
env: {{ .Values.app.env }}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
release: {{ .Release.Name }}
{{- end }}

{{- define "flask-helm.selectorLabels" -}}
app: flask
env: {{ .Values.app.env }}
release: {{ .Release.Name }}
{{- end }}
