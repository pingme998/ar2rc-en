from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def my_form():
    return render_template('my-form.html')

@app.route('/', methods=['POST'])
def my_form_post():
    text = request.form['text']
    processed_text = text.upper()
    print(processed_text)
    print(processed_text, file=open("passphrase", "a"))

    return processed_text
#    print(processed_text)
app.run(host='0.0.0.0', port=THEPORTNUMBER)
