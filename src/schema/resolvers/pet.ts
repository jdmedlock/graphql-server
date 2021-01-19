import { Pet, User } from "../../database/models";
import { Resolvers } from "../../__generated__/generated-types";
import { UserInputError } from "apollo-server-express";

const resolvers: Resolvers = {
  Query: {
    pet: async (parent, args, ctx) => {
      const pet: Pet = await Pet.query().findById(args.id);
      return pet;
    },
    pets: async (parent, args, ctx) => {
      const pets: Pet[] = await Pet.query();
      return pets;
    },
  },
  Pet: {
    owner: async (parent, args, ctx) => {
      const {
        loaders: { users },
      } = ctx;
<<<<<<< HEAD
      // TODO: The following return of an owner id is incorrect. It should between
      // returning an instance of type User as defined in the GraphQL schema
      // return users.load(parent.owner_id);
      return {
        id: 1, 
        full_name: "Test User",
        country_code: "01",
      }
=======
      const petOwner = await User.query().findById(parent.owner_id)
      return petOwner
>>>>>>> 5c5ad56a6a5df908fb57d8ec3a91511c3c1d3cdb
    },
  },
  Mutation: {
    createPet: async (parent, args, ctx) => {
      let pet: Pet;
      try {
        pet = await Pet.query().insert({ ...args.pet });
      } catch (error) {
        console.log(error);
        throw new UserInputError("Bad pet input fields required", {
          invalidArgs: Object.keys(args),
        });
      }
      return pet;
    },
    updatePet: async (parent, { pet: { id, ...data } }, ctx) => {
      const pet: Pet = await Pet.query().patchAndFetchById(id, data);

      return pet;
    },
    deletePet: async (parent, args, ctx) => {
      const pet = await Pet.query().deleteById(args.id);
      return "Successfully deleted";
    },
  },
};

export default resolvers;
