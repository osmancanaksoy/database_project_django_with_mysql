# Generated by Django 4.1.3 on 2022-12-21 20:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0010_merge_20221221_2030'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart_Model',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.DeleteModel(
            name='Cart',
        ),
    ]
