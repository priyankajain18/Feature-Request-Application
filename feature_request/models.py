# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=75)
    is_enabled = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class Client(models.Model):
    name = models.CharField(max_length=75)

    def __str__(self):
        return self.name

class Feature(models.Model):
    title = models.CharField(max_length=75)
    description = models.CharField(max_length=255, blank=True, null=True)
    target_date = models.DateTimeField(auto_now_add=False, auto_now=False)
    product = models.ForeignKey(Product)
    client = models.ForeignKey(Client)
    priority = models.PositiveSmallIntegerField(default=1)

    class Meta:
        unique_together = (('client', 'priority'), )

    def __str__(self):
        return self.title
