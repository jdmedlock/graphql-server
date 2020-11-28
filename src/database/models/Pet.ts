import {Model} from 'objection';
import {Species,Maybe} from '../../__generated__/generated-types';

import User from './User';

class Pet extends Model{
    id! : number;
    name?: Maybe<string>;
    specie?: Maybe<Species>; 
    created_at?:string;
    owner_id!:number;
    owner?:User;

    static get tableName() {
        return 'pets';
    }

    static jsonSchema ={
        type:'object',
        required:['name'],

        properties:{
            id:{type:'integer'},
            name:{type:'string', min:1, max:255},
            specie:{type:'string',min:1, max:255},
            created_at:{type:'string',min:1, max:255}
        }
    };

    static relationMappings=()=>({
        owner:{
            relation:Model.BelongsToOneRelation,
            modelClass:User,
            join: {
                from: 'pets.owner_id',
                to: 'users.id',
              }
        }
    });

    
};

export default Pet;