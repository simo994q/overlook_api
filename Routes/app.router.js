import express from 'express'
const AppRouter = express.Router()
import DestinationController from '../Controllers/destination.controller.js'
import NewsController from '../Controllers/news.controller.js'
import ImageController from '../Controllers/image.controller.js'
import ReservationController from '../Controllers/reservation.controller.js'
import ReviewController from '../Controllers/review.controller.js'
import { Authorize } from '../Middleware/auth.js'

// Destination Routes
const destcontrol = new DestinationController;
AppRouter.get('/destinations', (req, res) => { destcontrol.list(req, res) })
AppRouter.get('/destinations/:destination([a-z]*)', (req, res) => { destcontrol.details(req, res) })

// News Routes
const newscontrol = new NewsController;
AppRouter.get('/news', (req, res) => { newscontrol.list(req, res) })
AppRouter.get('/news/:id([0-9]*)', (req, res) => { newscontrol.details(req, res) })

// Reservation Routes
const reservationcontrol = new ReservationController;
AppRouter.get('/reservations', (req, res) => { reservationcontrol.list(req, res) })
AppRouter.get('/reservations/:id([0-9]*)', (req, res) => { reservationcontrol.details(req, res) })
AppRouter.post('/reservations', (req, res) => { reservationcontrol.create(req, res) })
AppRouter.delete('/reservations', (req, res) => { reservationcontrol.remove(req, res) })

// Rating Routes
const reviewcontrol = new ReviewController;
AppRouter.get('/reviews/all', Authorize, (req, res) => { reviewcontrol.list(req, res) }) // Array with all ratings
AppRouter.get('/reviews/list_by_hotel/:hotel_id([0-9]*)', Authorize, (req, res) => { reviewcontrol.list_by_hotel(req, res) }) // Array with all ratings
AppRouter.get('/reviews/average_by_hotel/:hotel_id([0-9]*)', (req, res) => { reviewcontrol.average_by_hotel(req, res) }) 
AppRouter.post('/reviews', Authorize, (req, res) => { reviewcontrol.create(req, res) })
AppRouter.delete('/reviews', Authorize, (req, res) => { reviewcontrol.remove(req, res) })

// Images Routes
const imgcontrol = new ImageController;
AppRouter.get('/imagelist', (req, res) => { imgcontrol.list(req, res) })


export default AppRouter