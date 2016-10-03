﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ecommerce_version2.Models;

namespace Ecommerce_version2.Controllers
{
    public class AdminFormController : Controller
    {
        //
        // GET: /AdminForm/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(AdminForm AdminForm)
        {
            if (ModelState.IsValid && AdminForm.adminName == "admin" && AdminForm.password == "admin") 
                return RedirectToAction("Admin");
            else
            {
                ModelState.AddModelError("AdminName", "chinchopa");
                return View("Index", AdminForm);
            }

        }
        public ActionResult Admin()
        {
            return View();
        }
        //
        // GET: /AdminForm/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /AdminForm/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AdminForm/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AdminForm/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /AdminForm/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AdminForm/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /AdminForm/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ADDSubAdmin()
        {
            return View();
        }
    }
}
