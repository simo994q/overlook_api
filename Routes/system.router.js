import express from 'express'
const CoreRouter = express.Router()
import UserController from '../Controllers/System/user.controller.js'
import GroupController from '../Controllers/System/group.controller.js'
import OrgController from '../Controllers/System/org.controller.js';
import { Authenticate, Authorize } from "../Middleware/auth.js"

// User Routes
const user_ctrl = new UserController;
CoreRouter.get('/users', (req, res) => { user_ctrl.list(req, res) })
CoreRouter.get('/users/:id([0-9]*)', (req, res) => { user_ctrl.details(req, res) })
CoreRouter.post('/users', (req, res) => { user_ctrl.create(req, res) })
CoreRouter.put('/users/:id([0-9]*)', (req, res) => { user_ctrl.update(req, res) })
CoreRouter.patch('/users', (req, res) => { user_ctrl.update_value(req, res) })
CoreRouter.delete('/users/:id([0-9]*)', (req, res) => { user_ctrl.remove(req, res) })

// Group Routes
const group_ctrl = new GroupController;
CoreRouter.get('/groups', (req, res) => { group_ctrl.list(req, res) })
CoreRouter.get('/groups/:id([0-9]*)', (req, res) => { group_ctrl.details(req, res) })
CoreRouter.post('/groups', (req, res) => { group_ctrl.create(req, res) })
CoreRouter.put('/groups/:id([0-9]*)', (req, res) => { group_ctrl.update(req, res) })
CoreRouter.delete('/groups', (req, res) => { group_ctrl.remove(req, res) })

// Organisation Routes
const org_ctrl = new OrgController
CoreRouter.get('/orgs', (req, res) => { org_ctrl.list(req, res) })
CoreRouter.get('/orgs/:id([0-9]*)', (req, res) => { org_ctrl.details(req, res) })
CoreRouter.post('/orgs', (req, res) => { org_ctrl.create(req, res) })
CoreRouter.put('/orgs/:id([0-9]*)', (req, res) => { org_ctrl.update(req, res) })
CoreRouter.delete('/orgs/:id([0-9]*)', (req, res) => { org_ctrl.remove(req, res) })

// Authorization Routes
CoreRouter.post('/login', (req, res) => { Authenticate(req, res) })
CoreRouter.get('/authorize', Authorize, (req, res, next) => { res.send('Du er logget ind') })

export default CoreRouter