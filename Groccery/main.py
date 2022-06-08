# from idlelib import run
# from tkinter.scrolledtext import example

# import development as development
import export as export
import flask
from flask import Flask, render_template, request, redirect, session, flash, jsonify, url_for
from mysqlconnection import MySQLConnector
import re

import MySQLdb


conn = MySQLdb.connect("localhost","root","root","grocerry" )
cursor = conn.cursor()

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
NAME_REGEX = re.compile(r'[0-9]')
PASS_REGEX = re.compile(r'.*[A-Z].*[0-9]')


app = Flask(__name__)
app.debug = True
#app.run(debug=True)
#get_send_file_max_age(5)
app.secret_key= 'grocerry'
mysql = MySQLConnector(app,'grocerry')
#FLASK_DEBUG=1 flask run
#if __name__ == "__main__":
  # from waitress import serve
 #   serve(app, host="0.0.0.0", port=8080)


@app.route('/')
def index():
    cursor.execute("SELECT * FROM products Order By Ranking DESC")
    data = cursor.fetchall()
    return render_template('index.html', value=data)

@app.route('/reconment')
def recoment():
    cursor.execute("SELECT * FROM products GROUP BY ranking HAVING COUNT(ranking)> 1")
    data = cursor.fetchall()
    return render_template('Recoment.html', value=data)

@app.route('/mail')
def mail():
    return render_template('mail.html')

@app.route('/products')
def products():
    cursor.execute("select * from products ")
    data = cursor.fetchall() 
    return render_template('products.html', value=data)

@app.route('/household')
def household():
    cursor.execute("select * from products where category='Households'")
    data = cursor.fetchall() 
    return render_template('household.html', value=data)

@app.route('/vegetables')
def vegetables():
    cursor.execute("select * from products where category='Vegetables' or category='Fruits'")
    data = cursor.fetchall() 
    return render_template('vegetables.html', value=data)


@app.route('/vieworder')
def vieworder():
    cursor.execute("select * from delivery_order")
    data = cursor.fetchall()
    return render_template('view_orders.html', value=data)

@app.route('/kitchen')
def kitchen():
    cursor.execute("select * from products where category='Kitchen'")
    data = cursor.fetchall() 
    return render_template('kitchen.html', value=data)

@app.route('/package')
def package():
    cursor.execute("select * from products where category='Package'")
    data = cursor.fetchall()
    return render_template('package.html', value=data)

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/single')
def single():
    return render_template('single.html')

@app.route('/admin')
def admin():
    return render_template('admin.html')

@app.route('/addproduct')
def addproduct():
    return render_template('add_product.html')

@app.route('/viewmail')
def viewmail():
    cursor.execute("select * from contact")
    data = cursor.fetchall() 
    return render_template('contact_requests.html', value=data)

@app.route('/viewcart')
def viewcart():
    username=session['username']
    print(username)
    if username=="":
        return redirect('/')
    else:
        cursor.execute("select * from cart where username='%s'"%username)
        data = cursor.fetchall()
        for i in data:
            pname = i[1]
            cursor.execute("select ranking from products where pname='%s'" % pname)
            rankdb = cursor.fetchone()
            rank = int(rankdb[0])
            query = "update products set ranking= :rank where pname= :pname"
            payload = {
                'pname': pname,
                'rank': rank+1
            }
            mysql.query_db(query, payload)

        cursor.execute("SELECT SUM(price) from cart where username='%s'"%username)
        summed=cursor.fetchone()
        print("summed=", summed)
        if summed[0]== None:
            return redirect('/')
        else:
            sum1=int(summed[0])+15
            print("sum=",sum1)
            session['price']=sum1
            return render_template('checkout.html', value=data,summed=sum1)

@app.route('/payment', methods=['POST'])
def payment():
    username=session['username']
    total_price=session['price']
    error=""
    item_list = []

    cursor.execute("select * from cart where username='%s'"%username)
    data = cursor.fetchall()

    for row in data:
        item_list.append(row[1])

    print ("Items to add", item_list)
    
    for x in request.form:
        if len(request.form[x]) < 1:
            print (x + " cannot be blank!", 'blank')
            error="Fill all fields"

    if len(request.form['mobile']) < 10 or len(request.form['mobile']) >10:
        error="Telephone must be 10 digits number!"

    if error!="":
        return redirect(url_for('.viewcart', error=error))
    
    else:
        print ("All Good!!!!", 'good')
        query = "INSERT INTO delivery_order (fname,mobile,landmark,town,address,username,price,items,expected_date) VALUES (:name, :mobile, :land, :town, :address, :username, :price, :items, :expdate)"
        
        data = {
                'name': request.form['fname'],
                'mobile': request.form['mobile'],
                'land': request.form['landmark'],
                'town': request.form['town'],
                'address': request.form['address'],
                'username': username,
                'price': total_price,
                'items': str(item_list),
                'expdate': 'NULL'
            }
        
        mysql.query_db(query, data)
    return render_template('payment.html')

@app.route('/placeorder', methods=['POST'])
def placeorder():
    username=session['username']
    
    query = "update delivery_order set expected_date= :expdate where username= :username"
        
    data = {
                'username': username,
                'expdate': request.form['expdate']
            }
        
    mysql.query_db(query, data)

    cursor.execute("delete from cart where username='%s'"%username)
    conn.commit()
    
    return redirect('/')

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect('/')

@app.route('/contact', methods=['POST'])
def contact_user():
    error=""
    for x in request.form:
        if len(request.form[x]) < 1:
            print (x + " cannot be blank!", 'blank')
    

    if len(request.form['Telephone']) < 10 or len(request.form['Telephone']) >10:
        error="Telephone must be 10 digits number!"

    if not EMAIL_REGEX.match(request.form['Email']):
        print ("Email must be a valid email", 'error')
        error= "Email must be a valid email"
    
    if error!="":
        return render_template('mail.html',error=error)
    else:
        print ("All Good!!!!", 'good')
        query = "INSERT INTO contact (name, email, telephone, subject, message) VALUES (:name, :email_id, :mob, :subject, :msg)"
        
        data = {
                'name': request.form['Name'],
                'email_id': request.form['Email'],
                'mob': request.form['Telephone'],
                'subject': request.form['Subject'],
                'msg': request.form['Message']
            }
        
        mysql.query_db(query, data)
        return render_template('mail.html',error="Request Sent!")
    
@app.route('/regu', methods=['POST'])
def register_user():
    error=""
    input_email = request.form['Email']
    email_query = "SELECT * FROM user WHERE email = :email_id"
    query_data = {'email_id': input_email}
    stored_email = mysql.query_db(email_query, query_data)


    print (request.form)
    print (request.form['Email'])

    for x in request.form:
        if len(request.form[x]) < 1:
            print (x + " cannot be blank!", 'blank')
            error="Fill all Fields"
    

    if len(request.form['Password']) < 5:
        print ("Password must be more than 5 characters", 'password')
        error="Password must be greater than 5 characters"

    if not EMAIL_REGEX.match(request.form['Email']):
        print ("Email must be a valid email", 'error')
        error= "Email must be a valid email"
    
    if stored_email:
        error="Email already exists!"


    if error!="":
        print ("error")
        return render_template('login.html',error=error)
        
    else:
        print ("All Good!!!!", 'good')
        query = "INSERT INTO user (uname, email, mob, address, password) VALUES (:username, :email_id, :mob, :address, :pass )"
        
        data = {
                'username': request.form['Username'],
                'email_id': request.form['Email'],
                'mob': request.form['Phone'],
                'address': request.form['Address'],
                'pass': request.form['Password']
            }
        
        mysql.query_db(query, data)

        input_email = request.form['Email']
        email_query = "SELECT * FROM user WHERE email = :email_id"
        query_data = {'email_id': input_email}
        stored_email = mysql.query_db(email_query, query_data)

        
         
        print ("This email address you entered " + input_email + " is a valid email address. Thank you!")
        return render_template('login.html')



@app.route('/loginu', methods=['POST'])
def loginu():
    error=""
    input_uname = request.form['Username']
    input_password = request.form['Password']
    email_query = "SELECT * FROM user WHERE uname = :uname "
    query_data = {'uname': str(input_uname)}
    stored_email = mysql.query_db(email_query, query_data)

    if not stored_email:
        error="User does not exist!"
        return render_template('login.html',error=error)

    else:
        if request.form['Password'] == stored_email[0]['password']:
            print ("login success")
            session['username'] = request.form['Username']
            return redirect('/')
        
        else:
            error="Wrong password, try again!"
            return render_template('login.html',error=error)
            
        
@app.route('/logina', methods=['POST'])
def logina():
    error=""
    input_uname = request.form['Username']
    input_password = request.form['Password']
    email_query = "SELECT * FROM admin WHERE username = :uname "
    query_data = {'uname': str(input_uname)}
    stored_email = mysql.query_db(email_query, query_data)

    if not stored_email:
        error="User does not exist!"
        return render_template('admin.html',error=error)

    else:
        if request.form['Password'] == stored_email[0]['password']:
            print ("login success")
            session['username'] = request.form['Username']
            return render_template('admin_home.html')
        
        else:
            error="Wrong password, try again!"
            return render_template('admin.html',error=error)
        
@app.route('/addproduct1', methods=['POST'])
def addproduct1():
    error=""
    
    for x in request.form:
        if len(request.form[x]) < 1:
            print (x + " cannot be blank!", 'blank')
            error="Fill all Fields"
    
    if error!="":
        print ("error")
        return render_template('add_product.html',error=error)
        
    else:
        print ("All Good!!!!", 'good')
        query = "INSERT INTO products (category, pname, quantity, price, pic) VALUES (:category, :pname, :quantity, :price, :pic )"
        
        data = {
                'category': request.form['Category'],
                'pname': request.form['pname'],
                'quantity': request.form['quantity'],
                'price': request.form['price'],
                'pic': request.form['pic']
            }
        
        mysql.query_db(query, data)
         
        return render_template('add_product.html',error="Product Added!")

@app.route('/addtocart', methods=['POST'])
def addtocart():
    print ("All Good!!!!", 'good')
    query = "INSERT INTO cart (item, price, username) VALUES (:item, :price, :username )"
        
    data = {
                'item': request.form['item_name'],
                'price': request.form['amount'],
                'username': session['username']
            }
        
    mysql.query_db(query, data)
    return redirect('/')


@app.route('/removeItem', methods=['POST'])
def removeItem():
    id=request.form['idcart']
    username=session['username']
    try:
        sql_query = "delete from cart where idcart='%s'"%id
        print(sql_query)
        mysql.query_db(sql_query)
        print("Item Deleted...!")
        cursor.execute("select * from cart where username='%s'" %username)
        data = cursor.fetchall()
        return render_template('checkout.html', value = data)
    except Exception as e:
        print("excpetion=",e)
    return redirect('/')     
    

if __name__ == "__main__": 
    app.run(debug=True)
