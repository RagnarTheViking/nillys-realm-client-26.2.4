package _1uq
{
   public class _13h
   {
       
      
      private var value;
      
      private var _0q3:_1uq._1bC_;
      
      private var token:_1uq._15Q_;
      
      public function _13h(param1:String)
      {
         super();
         this._0q3 = new _1uq._1bC_(param1);
         this._0C_4();
         this.value = this._10F_();
      }
      
      public function getValue() : *
      {
         return this.value;
      }
      
      private function _0C_4() : _1uq._15Q_
      {
         return this.token = this._0q3._vR_();
      }
      
      private function _8w() : Array
      {
         var _loc1_:Array = new Array();
         this._0C_4();
         if(this.token.type == _1ww._1B_Z_)
         {
            return _loc1_;
         }
         while(true)
         {
            _loc1_.push(this._10F_());
            this._0C_4();
            if(this.token.type == _1ww._1B_Z_)
            {
               break;
            }
            if(this.token.type == _1ww._1F_)
            {
               this._0C_4();
            }
            else
            {
               this._0q3._0ub("Expecting ] or , but found " + this.token.value);
            }
         }
         return _loc1_;
      }
      
      private function _0B_o() : Object
      {
         var _loc1_:String = null;
         var _loc2_:Object = new Object();
         this._0C_4();
         if(this.token.type == _1ww._1tM_)
         {
            return _loc2_;
         }
         while(true)
         {
            if(this.token.type == _1ww._0bO_)
            {
               _loc1_ = String(this.token.value);
               this._0C_4();
               if(this.token.type == _1ww._1sx)
               {
                  this._0C_4();
                  _loc2_[_loc1_] = this._10F_();
                  this._0C_4();
                  if(this.token.type == _1ww._1tM_)
                  {
                     break;
                  }
                  if(this.token.type == _1ww._1F_)
                  {
                     this._0C_4();
                  }
                  else
                  {
                     this._0q3._0ub("Expecting } or , but found " + this.token.value);
                  }
               }
               else
               {
                  this._0q3._0ub("Expecting : but found " + this.token.value);
               }
            }
            else
            {
               this._0q3._0ub("Expecting string but found " + this.token.value);
            }
         }
         return _loc2_;
      }
      
      private function _10F_() : Object
      {
         if(this.token == null)
         {
            this._0q3._0ub("Unexpected end of input");
         }
         switch(this.token.type)
         {
            case _1ww._1R_A_:
               return this._0B_o();
            case _1ww._W_3:
               return this._8w();
            case _1ww._0bO_:
            case _1ww._6Y_:
            case _1ww._0yc:
            case _1ww._M_8:
            case _1ww.NULL:
               return this.token.value;
            default:
               this._0q3._0ub("Unexpected " + this.token.value);
               return null;
         }
      }
   }
}
