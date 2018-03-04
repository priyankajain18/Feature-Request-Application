# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.contrib import auth

from rest_framework.response import Response
from rest_framework.decorators import api_view

from users.models import EmployeeDepartment, Employee, CustomUser

@api_view(['GET', 'POST'])
def sign_up(request):
    if request.method == "GET":
        departments = EmployeeDepartment.objects.all()
        return render(request, 'users/sign_up.html', {'departments': departments})

    if request.method == "POST":
        data = request.POST
        
        if Employee.objects.filter(employee_code=data['e_code']) or Employee.objects.filter(user__email=data['email']):
            return Response({'e_message': 'Employee Already Exists'})
            
        user = CustomUser.objects.create_user(email=data['email'], \
            password=data['password'], first_name=data['first_name'], last_name=data['last_name'], \
            contact_number=data['contact_number'])
        Employee.objects.create(employee_code=data['e_code'], department_id=data['d_code'], user=user)
            
        return Response({'e_message': ''})

@api_view(['GET', 'POST'])
def sign_in(request):
    if request.method == "GET":
        return render(request, 'users/sign_in.html')

    if request.method == "POST":
        data = request.POST
        context = {}

        user = auth.authenticate(email=data['email'], password=data['password'])
        if user is not None:
            auth.login(request, user)
            context['user_id'] = user.id
            context['first_name'] = user.first_name
            context['last_name'] = user.last_name
            context['email'] = user.email
            context['employee_code'] = user.employee_code
            context['joining_date'] = user.joining_date
            context['d_name'] = user.department.name
            context['d_description'] = user.department.description
            context['d_code'] = user.department.d_code
            context['success'] = True
            context['error'] = ""
        else:
            context['success'] = False
            context['error'] = "Either Employee Code or Password is Incorrect"

        return Response(context)
