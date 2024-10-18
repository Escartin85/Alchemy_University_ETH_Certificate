// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }
    
    Project[] projects;

    // TODO: add the findWinner function
    // Function to find the project with the highest average rating
    function findWinner() external view returns (Project memory) {
        require(projects.length > 0, "No projects available");
        
        uint highestAvg = 0;
        uint winnerIdx = 0;

        for (uint i = 0; i < projects.length; i++) {
            uint sum = 0;
            uint ratingsCount = projects[i].ratings.length;

            if (ratingsCount == 0) {
                continue; // Skip projects without any ratings
            }

            // Calculate the sum of all ratings
            for (uint j = 0; j < ratingsCount; j++) {
                sum += projects[i].ratings[j];
            }

            // Calculate the average rating
            uint avg = sum / ratingsCount;

            // Check if this project has the highest average so far
            if (avg > highestAvg) {
                highestAvg = avg;
                winnerIdx = i;
            }
        }

        // Return the project with the highest average rating
        return projects[winnerIdx];
    }

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        require(_idx < projects.length, "Invalid project index");
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}
