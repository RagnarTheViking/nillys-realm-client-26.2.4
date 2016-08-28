package _7m
{
   import _C_._1O_I_;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class StatData
   {
      
      public static const MAXHP:int = 0;
      
      public static const HP:int = 1;
      
      public static const SIZE:int = 2;
      
      public static const MAXMP:int = 3;
      
      public static const MP:int = 4;
      
      public static const EXPGOAL:int = 5;
      
      public static const EXP:int = 6;
      
      public static const LEVEL:int = 7;
      
      public static const ATTACK:int = 20;
      
      public static const DEFENSE:int = 21;
      
      public static const SPEED:int = 22;
      
      public static const INVENTORY_0_STAT:int = 8;
      
      public static const INVENTORY_1_STAT:int = 9;
      
      public static const INVENTORY_2_STAT:int = 10;
      
      public static const INVENTORY_3_STAT:int = 11;
      
      public static const INVENTORY_4_STAT:int = 12;
      
      public static const INVENTORY_5_STAT:int = 13;
      
      public static const INVENTORY_6_STAT:int = 14;
      
      public static const INVENTORY_7_STAT:int = 15;
      
      public static const INVENTORY_8_STAT:int = 16;
      
      public static const INVENTORY_9_STAT:int = 17;
      
      public static const INVENTORY_10_STAT:int = 18;
      
      public static const INVENTORY_11_STAT:int = 19;
      
      public static const VITALITY:int = 26;
      
      public static const WISDOM:int = 27;
      
      public static const DEXTERITY:int = 28;
      
      public static const EFFECTS:int = 29;
      
      public static const STARS:int = 30;
      
      public static const NAME:int = 31;
      
      public static const TEX1_STAT:int = 32;
      
      public static const TEX2_STAT:int = 33;
      
      public static const MERCHANTMERCHANDISETYPE:int = 34;
      
      public static const CREDITS:int = 35;
      
      public static const SELLABLEPRICE:int = 36;
      
      public static const PROTALUSABLE:int = 37;
      
      public static const ACCOUNTID:int = 38;
      
      public static const CURRENTFAME:int = 39;
      
      public static const SELLABLEPRICECURRENCY:int = 40;
      
      public static const OBJECTCONNECTION:int = 41;
      
      public static const MERCHANTREMAININGCOUNT:int = 42;
      
      public static const MERCHANTREMAININGMINUTE:int = 43;
      
      public static const MERCHANTDISCOUNT:int = 44;
      
      public static const SELLABLERANKREQUIREMENT:int = 45;
      
      public static const HPBONUS:int = 46;
      
      public static const MPBONUS:int = 47;
      
      public static const ATTACKBONUS:int = 48;
      
      public static const DEFENSEBONUS:int = 49;
      
      public static const SPEEDBOUNUS:int = 50;
      
      public static const VITALITYBONUS:int = 51;
      
      public static const WISDOMBONUS:int = 52;
      
      public static const DEXTERITYBONUS:int = 53;
      
      public static const OWNERACCOUNTID:int = 54;
      
      public static const NAMECHANGERSTAR:int = 55;
      
      public static const NAMECHOSEN:int = 56;
      
      public static const FAME:int = 57;
      
      public static const FAMEGOAL:int = 58;
      
      public static const GLOWING:int = 59;
      
      public static const SINKOFFSET:int = 60;
      
      public static const ALTTEXTUREINDEX:int = 61;
      
      public static const GUILD:int = 62;
      
      public static const GUILDRANK:int = 63;
      
      public static const OXYGENBAR:int = 64;
      
      public static const XPBOOST:int = 65;
      
      public static const XPBOOSTTIME:int = 66;
      
      public static const DROPRATETIME:int = 67;
      
      public static const LOOTTIERTIME:int = 68;
      
      public static const HEALTHSTACKCOUNT:int = 69;
      
      public static const MAGICSTACKCOUNT:int = 70;
      
      public static const BACKPACK_0_STAT:int = 71;
      
      public static const BACKPACK_1_STAT:int = 72;
      
      public static const BACKPACK_2_STAT:int = 73;
      
      public static const BACKPACK_3_STAT:int = 74;
      
      public static const BACKPACK_4_STAT:int = 75;
      
      public static const BACKPACK_5_STAT:int = 76;
      
      public static const BACKPACK_6_STAT:int = 77;
      
      public static const BACKPACK_7_STAT:int = 78;
      
      public static const HASBACKPACK:int = 79;
      
      public static const SKIN:int = 80;
      
      public static const PETID:int = 81;
      
      public static const PETSKIN:int = 82;
      
      public static const PETTYPE:int = 83;
      
      public static const PETRARITY:int = 84;
      
      public static const PETMAXLEVEL:int = 85;
      
      public static const PETUNK1:int = 86;
      
      public static const FOODSPENTSKILL1:int = 87;
      
      public static const FOODSPENTSKILL2:int = 88;
      
      public static const FOODSPENTSKILL3:int = 89;
      
      public static const PETSKILL1LEVEL:int = 90;
      
      public static const PETSKILL2LEVEL:int = 91;
      
      public static const PETSKILL3LEVEL:int = 92;
      
      public static const PETSKILL1TYPE:int = 93;
      
      public static const PETSKILL2TYPE:int = 94;
      
      public static const PETSKILL3TYPE:int = 95;
      
      public static const EFFECTS2:int = 96;
      
      public static const TOKENS:int = 97;
      
      public static const DAMAGEMIN:int = 98;
      
      public static const DAMAGEMAX:int = 99;
      
      public static const DAMAGEMINBONUS:int = 100;
      
      public static const DAMAGEMAXBONUS:int = 101;
      
      public static const LUCKBOOST:int = 102;
      
      public static const RANK:int = 103;
      
      public static const ADMIN:int = 104;
       
      
      public var _M_K_:uint = 0;
      
      public var _16Q_:int;
      
      public var _vP_:String;
      
      public function StatData()
      {
         super();
      }
      
      public static function _N_v(param1:int) : String
      {
         switch(param1)
         {
            case MAXHP:
               return _1O_I_._1B_L_;
            case HP:
               return _1O_I_._0t9;
            case SIZE:
               return _1O_I_._16c;
            case MAXMP:
               return _1O_I_._0ti;
            case MP:
               return _1O_I_._F_u;
            case EXP:
               return _1O_I_._1G_1;
            case LEVEL:
               return _1O_I_._Y_u;
            case ATTACK:
               return _1O_I_._1cp;
            case DEFENSE:
               return _1O_I_._1D_P_;
            case SPEED:
               return _1O_I_._G_d;
            case VITALITY:
               return _1O_I_._1gd;
            case WISDOM:
               return _1O_I_._Y_f;
            case DEXTERITY:
               return _1O_I_._K_j;
            case LUCKBOOST:
               return _1O_I_._lk3;
            default:
               return _1O_I_._0B_t;
         }
      }
      
      public function _06p() : Boolean
      {
         switch(this._M_K_)
         {
            case NAME:
            case GUILD:
            case PETSKIN:
               return true;
            default:
               switch(this._M_K_)
               {
                  case ACCOUNTID:
                  case OWNERACCOUNTID:
                     return !!WebMain.pserver?false:true;
                  default:
                     return false;
               }
         }
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
         this._M_K_ = param1.readUnsignedByte();
         if(!this._06p())
         {
            this._16Q_ = param1.readInt();
         }
         else
         {
            this._vP_ = param1.readUTF();
         }
      }
      
      public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeByte(this._M_K_);
         if(!this._06p())
         {
            param1.writeInt(this._16Q_);
         }
         else
         {
            param1.writeUTF(this._vP_);
         }
      }
      
      public function toString() : String
      {
         if(!this._06p())
         {
            return "[" + this._M_K_ + ": " + this._16Q_ + "]";
         }
         return "[" + this._M_K_ + ": \"" + this._vP_ + "\"]";
      }
   }
}
