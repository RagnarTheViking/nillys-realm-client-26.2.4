package _1uq
{
   public class _1bC_
   {
       
      
      private var obj:Object;
      
      private var _06w:String;
      
      private var _1ij:int;
      
      private var ch:String;
      
      public function _1bC_(param1:String)
      {
         super();
         this._06w = param1;
         this._1ij = 0;
         this._R_T_();
      }
      
      public function _vR_() : _15Q_
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:_15Q_ = new _15Q_();
         this._18k();
         switch(this.ch.toLocaleLowerCase())
         {
            case "{":
               _loc4_.type = _1ww._1R_A_;
               _loc4_.value = "{";
               this._R_T_();
               break;
            case "}":
               _loc4_.type = _1ww._1tM_;
               _loc4_.value = "}";
               this._R_T_();
               break;
            case "[":
               _loc4_.type = _1ww._W_3;
               _loc4_.value = "[";
               this._R_T_();
               break;
            case "]":
               _loc4_.type = _1ww._1B_Z_;
               _loc4_.value = "]";
               this._R_T_();
               break;
            case ",":
               _loc4_.type = _1ww._1F_;
               _loc4_.value = ",";
               this._R_T_();
               break;
            case ":":
               _loc4_.type = _1ww._1sx;
               _loc4_.value = ":";
               this._R_T_();
               break;
            case "t":
               _loc1_ = "t" + this._R_T_() + this._R_T_() + this._R_T_();
               if(_loc1_ == "true")
               {
                  _loc4_.type = _1ww._0yc;
                  _loc4_.value = true;
                  this._R_T_();
               }
               else
               {
                  this._0ub("Expecting \'true\' but found " + _loc1_);
               }
               break;
            case "f":
               _loc2_ = "f" + this._R_T_() + this._R_T_() + this._R_T_() + this._R_T_();
               if(_loc2_ == "false")
               {
                  _loc4_.type = _1ww._M_8;
                  _loc4_.value = false;
                  this._R_T_();
               }
               else
               {
                  this._0ub("Expecting \'false\' but found " + _loc2_);
               }
               break;
            case "n":
               _loc3_ = "n" + this._R_T_() + this._R_T_() + this._R_T_();
               if(_loc3_ == "null")
               {
                  _loc4_.type = _1ww.NULL;
                  _loc4_.value = null;
                  this._R_T_();
               }
               else
               {
                  this._0ub("Expecting \'null\' but found " + _loc3_);
               }
               break;
            case "\"":
               _loc4_ = this._az();
               break;
            default:
               if(this._17j(this.ch) || this.ch == "-")
               {
                  _loc4_ = this._4H_();
               }
               else
               {
                  if(this.ch == "")
                  {
                     return null;
                  }
                  this._0ub("Unexpected " + this.ch + " encountered");
               }
         }
         return _loc4_;
      }
      
      private function _az() : _15Q_
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:_15Q_ = new _15Q_();
         _loc3_.type = _1ww._0bO_;
         var _loc4_:* = "";
         this._R_T_();
         while(this.ch != "\"" && this.ch != "")
         {
            if(this.ch == "\\")
            {
               this._R_T_();
               switch(this.ch)
               {
                  case "\"":
                     _loc4_ = _loc4_ + "\"";
                     break;
                  case "/":
                     _loc4_ = _loc4_ + "/";
                     break;
                  case "\\":
                     _loc4_ = _loc4_ + "\\";
                     break;
                  case "b":
                     _loc4_ = _loc4_ + "\b";
                     break;
                  case "f":
                     _loc4_ = _loc4_ + "\f";
                     break;
                  case "n":
                     _loc4_ = _loc4_ + "\n";
                     break;
                  case "r":
                     _loc4_ = _loc4_ + "\r";
                     break;
                  case "t":
                     _loc4_ = _loc4_ + "\t";
                     break;
                  case "u":
                     _loc1_ = "";
                     _loc2_ = 0;
                     while(_loc2_ < 4)
                     {
                        if(!this._19n(this._R_T_()))
                        {
                           this._0ub(" Excepted a hex digit, but found: " + this.ch);
                        }
                        _loc1_ = _loc1_ + this.ch;
                        _loc2_++;
                     }
                     _loc4_ = _loc4_ + String.fromCharCode(parseInt(_loc1_,16));
                     break;
                  default:
                     _loc4_ = _loc4_ + ("\\" + this.ch);
               }
            }
            else
            {
               _loc4_ = _loc4_ + this.ch;
            }
            this._R_T_();
         }
         if(this.ch == "")
         {
            this._0ub("Unterminated string literal");
         }
         this._R_T_();
         _loc3_.value = _loc4_;
         return _loc3_;
      }
      
      private function _4H_() : _15Q_
      {
         var _loc1_:_15Q_ = new _15Q_();
         _loc1_.type = _1ww._6Y_;
         var _loc2_:* = "";
         if(this.ch == "-")
         {
            _loc2_ = _loc2_ + "-";
            this._R_T_();
         }
         if(!this._17j(this.ch))
         {
            this._0ub("Expecting a digit");
         }
         if(this.ch == "0")
         {
            _loc2_ = _loc2_ + this.ch;
            this._R_T_();
            if(this._17j(this.ch))
            {
               this._0ub("A digit cannot immediately follow 0");
            }
         }
         else
         {
            while(this._17j(this.ch))
            {
               _loc2_ = _loc2_ + this.ch;
               this._R_T_();
            }
         }
         if(this.ch == ".")
         {
            _loc2_ = _loc2_ + ".";
            this._R_T_();
            if(!this._17j(this.ch))
            {
               this._0ub("Expecting a digit");
            }
            while(this._17j(this.ch))
            {
               _loc2_ = _loc2_ + this.ch;
               this._R_T_();
            }
         }
         if(this.ch == "e" || this.ch == "E")
         {
            _loc2_ = _loc2_ + "e";
            this._R_T_();
            if(this.ch == "+" || this.ch == "-")
            {
               _loc2_ = _loc2_ + this.ch;
               this._R_T_();
            }
            if(!this._17j(this.ch))
            {
               this._0ub("Scientific notation number needs exponent value");
            }
            while(this._17j(this.ch))
            {
               _loc2_ = _loc2_ + this.ch;
               this._R_T_();
            }
         }
         var _loc3_:Number = Number(_loc2_);
         if(isFinite(_loc3_) && !isNaN(_loc3_))
         {
            _loc1_.value = _loc3_;
            return _loc1_;
         }
         this._0ub("Number " + _loc3_ + " is not valid!");
         return null;
      }
      
      private function _R_T_() : String
      {
         return this.ch = this._06w.charAt(this._1ij++);
      }
      
      private function _18k() : void
      {
         var _loc1_:int = 0;
         do
         {
            _loc1_ = this._1ij;
            this._1R_w();
            this._1I___();
         }
         while(_loc1_ != this._1ij);
         
      }
      
      private function _1I___() : void
      {
         if(this.ch == "/")
         {
            this._R_T_();
            switch(this.ch)
            {
               case "/":
                  do
                  {
                     this._R_T_();
                  }
                  while(this.ch != "\n" && this.ch != "");
                  
                  this._R_T_();
                  return;
               case "*":
                  this._R_T_();
                  while(true)
                  {
                     if(this.ch == "*")
                     {
                        this._R_T_();
                        if(this.ch == "/")
                        {
                           break;
                        }
                     }
                     else
                     {
                        this._R_T_();
                     }
                     if(this.ch == "")
                     {
                        this._0ub("Multi-line comment not closed");
                     }
                  }
                  this._R_T_();
                  return;
               default:
                  this._0ub("Unexpected " + this.ch + " encountered (expecting \'/\' or \'*\' )");
            }
         }
      }
      
      private function _1R_w() : void
      {
         while(this._0G_U_(this.ch))
         {
            this._R_T_();
         }
      }
      
      private function _0G_U_(param1:String) : Boolean
      {
         return param1 == " " || param1 == "\t" || param1 == "\n" || param1 == "\r";
      }
      
      private function _17j(param1:String) : Boolean
      {
         return param1 >= "0" && param1 <= "9";
      }
      
      private function _19n(param1:String) : Boolean
      {
         var _loc2_:String = param1.toUpperCase();
         return this._17j(param1) || _loc2_ >= "A" && _loc2_ <= "F";
      }
      
      public function _0ub(param1:String) : void
      {
         throw new JSONParseError(param1,this._1ij,this._06w);
      }
   }
}
