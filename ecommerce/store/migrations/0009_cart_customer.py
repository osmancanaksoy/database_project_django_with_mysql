# Generated by Django 4.1.3 on 2022-12-21 01:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0008_rename_profil_photo_customer_profile_photo'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='customer',
            field=models.OneToOneField(default=1, on_delete=django.db.models.deletion.CASCADE, to='store.customer'),
            preserve_default=False,
        ),
    ]
