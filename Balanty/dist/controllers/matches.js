"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteMatch = exports.deletePlayerMatch = exports.searchMatches = exports.JoinToMatch = exports.getMatchData = exports.getMyMatches = exports.getMatches = exports.createMatch = void 0;
const services_1 = require("../services");
const matches_1 = require("../services/matches");
const createMatch = async (req, res) => {
    const data = (await (0, services_1.createMatchService)(req));
    res.status(data?.status).json(data);
};
exports.createMatch = createMatch;
const getMatches = async (req, res) => {
    const data = await (0, services_1.getAllMatches)(req);
    res.status(data.status).json(data);
};
exports.getMatches = getMatches;
const getMyMatches = async (req, res) => {
    const data = await (0, services_1.getMyMatchesService)(req);
    res.status(data.status).json(data);
};
exports.getMyMatches = getMyMatches;
const getMatchData = async (req, res) => {
    const data = await (0, services_1.getMatchDataService)(req);
    res.status(data.status).json(data);
};
exports.getMatchData = getMatchData;
const JoinToMatch = async (req, res) => {
    const data = await (0, services_1.JoinToMatchService)(req);
    res.status(data.status).json(data);
};
exports.JoinToMatch = JoinToMatch;
const searchMatches = async (req, res) => {
    const response = await (0, services_1.getAllMatches)(req);
    res.status(response.status).json(response);
};
exports.searchMatches = searchMatches;
const deletePlayerMatch = async (req, res) => {
    const data = await (0, matches_1.deletePlayrerMatch)(req);
    res.status(data.status).json(data);
};
exports.deletePlayerMatch = deletePlayerMatch;
const deleteMatch = async (req, res) => {
    const data = await (0, matches_1.delOwnMatch)(req);
    res.status(data.status).json(data);
};
exports.deleteMatch = deleteMatch;
