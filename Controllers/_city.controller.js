import sequelize from "../Config/sequelize.config.js"
import Cities from "../Models/city.model.js"
import Countries from "../Models/country.model.js"
import Hotels from "../Models/hotel.model.js"
import { Images as CityImages } from "../Models/image.model.js"
import { Images as HotelImages } from "../Models/image.model.js"

// Definerer relation mellem by og hotel - one to many
Countries.hasMany(Cities)
Cities.belongsTo(Countries)

// Definerer relation mellem by og hotel - one to many
CityImages.hasMany(Cities)
Cities.belongsTo(CityImages)

// Definerer relation mellem hotel og image - one to many
Cities.hasMany(Hotels)
Hotels.belongsTo(Cities)

// Definerer relation mellem hotel og image - one to many
HotelImages.hasMany(Hotels)
Hotels.belongsTo(HotelImages)

/**
 * Controller foc City Actions
 */
class CityController {
  /**
   * Method List
   * @param {Object} req Express Request Object
   * @param {Object} res Express Response Object
   */
  list = async (req, res) => {
    // Destructure Assignment - optional list management
    let { sortkey, sortdir, limit, attributes } = req.query
    // Sætter array til sort og retning
    const order = [sortkey ? sortkey : "id"]
    order.push(sortdir || "ASC")
    // Sætter limit antal
    limit = parseInt(limit) || 1000
    // Sætter attributter (table felter)
    const attr = attributes
      ? attributes.split(",")
      : new Array("id", "name", "description", "country_id", "image_id")

    // Eksekverer sequelize metode med management values
    const result = await Cities.findAll({
      attributes: attr,
      order: [order],
      limit: limit,
      include: [
        {
          model: Countries,
          attributes: ["id", "name"],
        },
        {
          model: CityImages,
          attributes: [
            "id",
            [
              sequelize.fn(
                "CONCAT",
                "http://localhost:4000/images/",
                sequelize.col("filename")
              ),
              "filename",
            ],
          ],
        },
      ],
    })
    // Udskriver resultat i json format
    res.json(result)
  }

  /**
   * Method Details
   * @param {Object} req Express Request Object
   * @param {Object} res Express Response Object
   */
  details = async (req, res) => {
    // Destructure assignment af id.
    const { id } = req.params || 0
    // Eksekverer sequelize metode med attributter og where clause
    const result = await Cities.findOne({
      attributes: ["id", "name", "description", "country_id", "image_id"],
      where: { id: id },
      include: [
        {
          model: CityImages,
          attributes: [
            "id",
            [
              sequelize.fn(
                "CONCAT",
                "http://localhost:4000/images/",
                sequelize.col("filename")
              ),
              "filename",
            ],
          ],
        },
        {
          model: Countries,
          attributes: ["name", "image_id"],
        },
        {
          model: Hotels,
          attributes: ["id", "title", "description", "address", "image_id"],
          /*
          include: {
            model: HotelImages
          }
          */
        },
      ],
    })
    // Udskriver resultat i json format
    res.json(result)
  }
}

export default CityController
