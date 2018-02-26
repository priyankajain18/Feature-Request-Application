# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.base_user import AbstractBaseUser

from phonenumber_field.modelfields import PhoneNumberField
from users.manager import CustomUserManager

class CustomUser(AbstractBaseUser):
    first_name = models.CharField(max_length=75, blank=True, null=True)
    last_name = models.CharField(max_length=75, blank=True, null=True)
    email = models.EmailField(unique=True)
    contact_number = PhoneNumberField()
    
    objects = CustomUserManager()

    EMAIL_FIELD = 'email'
    USERNAME_FIELD = 'email'

    def get_full_name(self):
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()
