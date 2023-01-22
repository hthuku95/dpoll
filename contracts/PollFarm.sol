// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollFarm {
    address[] public polls;
    address[] public voters;

    struct Poll {
      address creator;
      string name;
      string question;
      bool isActive;
      uint256 numberOfVotes;
      mapping(string => uint256)  answerA;
      mapping(string => uint256)  answerB;
      mapping(string => uint256)  answerC;
      mapping(string => uint256)  answerD;

    }

    enum Answer {
      A,
      B,
      C,
      D
    }

    Answer public answer;

    // registering to be a voter
    function register() public {
      voters.push(msg.sender);
    }

    // creating a poll 
    function createPoll(string _name, string _question, bool _isActive, uint256 numberOfVotes, string _answerA, string _answerB, string _answerC, string _answerD) public {
      Poll newPoll = Poll(
        msg.sender,
        _name,
        _question,
        false,
        0,
        answerA[_answerA] = 0,
        answerB[_answerB] = 0,
        answerC[_answerC] = 0,
        answerD[_answerD] = 0,
      );
      polls.push(newPoll);
    }

    function startPoll(Poll _poll) public {
      require(msg.sender == _poll.creator,"Only the creator can start the poll");
      _poll.isActive = true;
    }

    function endPoll(Poll _poll) public {
      require(msg.sender == _poll.creator,"Only the creator can end the poll");
      _poll.isActive = false;
    }

    function vote(Poll _poll,Answer _newAnswer) public {
      require(_poll.isActive == true,"The poll must be open for you to be able to vote");
      require(voters.contains(msg.sender),"You must be a registerd voter to vote");

      answer = _newAnswer;
      if (answer == Answer.A) {

      } else if (answer == Answer.B) {

      } else if (answer == Answer.C) {

      } else {
        
      }
    }
    /***Lets get inspiration from smart contract lottery project */

}