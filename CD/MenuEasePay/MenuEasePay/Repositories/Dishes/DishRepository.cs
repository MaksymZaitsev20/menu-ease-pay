using Dapper;
using MenuEasePay.Models;
using System.Data.SqlClient;

namespace MenuEasePay.Repositories.Dishes;

public class DishRepository : BaseRepository, IDishRepository
{
    private readonly string _connectionString;

    public DishRepository(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString(DefaultConnectionName);
    }

    public List<Dish> GetDishes()
    {
        using var dbConnection = new SqlConnection(_connectionString);
        dbConnection.Open();
        return dbConnection.Query<Dish>("SELECT * FROM Dish").ToList();
    }

    public Dish GetDishById(int id)
    {
        using var dbConnection = new SqlConnection(_connectionString);
        dbConnection.Open();
        return dbConnection.QueryFirstOrDefault<Dish>("SELECT * FROM Dish WHERE DishID = @Id", new { Id = id });
    }

    public void AddDish(Dish dish)
    {
        using var dbConnection = new SqlConnection(_connectionString);
        dbConnection.Open();
        dbConnection.Execute("INSERT INTO Dish (Name, Description, Price) VALUES (@Name, @Description, @Price)", dish);
    }

    public void UpdateDish(Dish dish)
    {
        using var dbConnection = new SqlConnection(_connectionString);
        dbConnection.Open();
        dbConnection.Execute("UPDATE Dish SET Name = @Name, Description = @Description, Price = @Price WHERE DishID = @DishID", dish);
    }

    public void DeleteDish(int id)
    {
        using var dbConnection = new SqlConnection(_connectionString);
        dbConnection.Open();
        dbConnection.Execute("DELETE FROM Dish WHERE DishID = @Id", new { Id = id });
    }
}