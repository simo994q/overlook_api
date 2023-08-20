import sequelize from "../Config/sequelize.config.js"
import { Images } from "../Models/image.model.js"

/**
 * Controller foc City Actions
 */
class ImageController {
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

    // Eksekverer sequelize metode med management values
    const result = await Images.findAll({
      attributes: ['id', 'title', 
        [
          sequelize.fn(
            "CONCAT",
            "http://localhost:4000/images/",
            sequelize.col("filename")
          ),
          "filename",
        ]],
      order: [order],
      limit: limit,
      
    })
    // Udskriver resultat i json format
    res.json(result)
  }
}

export default ImageController
