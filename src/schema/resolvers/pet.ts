import { Pet } from "../../database/models";
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
      console.log('resolvers pets: ', pets)
      return pets;
    },
  },
  Pet: {
    owner: async (parent, args, ctx) => {
      const {
        loaders: { users },
      } = ctx;
      // TODO: The following return of an owner id is incorrect. It should between
      // returning an instance of type User as defined in the GraphQL schema
      // return users.load(parent.owner_id);
      return {
        id: 1, 
        full_name: "Test User",
        country_code: "01",
      }
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
