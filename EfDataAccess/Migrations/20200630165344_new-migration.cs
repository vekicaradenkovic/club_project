using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class newmigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PositionId",
                table: "TeamMembers",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserUseCases_UseCaseId",
                table: "UserUseCases",
                column: "UseCaseId");

            migrationBuilder.CreateIndex(
                name: "IX_TeamMembers_PositionId",
                table: "TeamMembers",
                column: "PositionId");

            migrationBuilder.AddForeignKey(
                name: "FK_TeamMembers_Positions_PositionId",
                table: "TeamMembers",
                column: "PositionId",
                principalTable: "Positions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UserUseCases_UseCases_UseCaseId",
                table: "UserUseCases",
                column: "UseCaseId",
                principalTable: "UseCases",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TeamMembers_Positions_PositionId",
                table: "TeamMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_UserUseCases_UseCases_UseCaseId",
                table: "UserUseCases");

            migrationBuilder.DropIndex(
                name: "IX_UserUseCases_UseCaseId",
                table: "UserUseCases");

            migrationBuilder.DropIndex(
                name: "IX_TeamMembers_PositionId",
                table: "TeamMembers");

            migrationBuilder.DropColumn(
                name: "PositionId",
                table: "TeamMembers");
        }
    }
}
