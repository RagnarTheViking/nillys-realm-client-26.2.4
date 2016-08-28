package _1xa
{
   import _03U_._1U_N_;
   
   public class AppendingLineBuilder implements _1eo
   {
       
      
      private var data:Vector.<LineData>;
      
      private var _0__j:String = "\n";
      
      private var provider:_1U_N_;
      
      public function AppendingLineBuilder()
      {
         this.data = new Vector.<LineData>();
         super();
      }
      
      public function pushParams(param1:String, param2:Object = null, param3:String = "", param4:String = "") : AppendingLineBuilder
      {
         this.data.push(new LineData().setKey(param1).setTokens(param2).setOpeningTags(param3).setClosingTags(param4));
         return this;
      }
      
      public function setDelimiter(param1:String) : AppendingLineBuilder
      {
         this._0__j = param1;
         return this;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
         this.provider = param1;
      }
      
      public function getString() : String
      {
         var _loc1_:LineData = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         for each(_loc1_ in this.data)
         {
            _loc2_.push(_loc1_.getString(this.provider));
         }
         return _loc2_.join(this._0__j);
      }
      
      public function _0tR_() : Boolean
      {
         return this.data.length != 0;
      }
      
      public function clear() : void
      {
         this.data = new Vector.<LineData>();
      }
   }
}

import _03U_._1U_N_;
import _1xa._1eo;
import _C_._1O_I_;

class LineData
{
    
   
   public var key:String;
   
   public var tokens:Object;
   
   public var openingHTMLTags:String = "";
   
   public var closingHTMLTags:String = "";
   
   function LineData()
   {
      super();
   }
   
   public function setKey(param1:String) : LineData
   {
      this.key = param1;
      return this;
   }
   
   public function setTokens(param1:Object) : LineData
   {
      this.tokens = param1;
      return this;
   }
   
   public function setOpeningTags(param1:String) : LineData
   {
      this.openingHTMLTags = param1;
      return this;
   }
   
   public function setClosingTags(param1:String) : LineData
   {
      this.closingHTMLTags = param1;
      return this;
   }
   
   public function getString(param1:_1U_N_) : String
   {
      var _loc2_:* = null;
      var _loc3_:_1eo = null;
      var _loc4_:String = null;
      var _loc5_:String = this.openingHTMLTags;
      _loc5_ = _loc5_.concat(param1.getValue(_1O_I_._195(this.key)));
      for(_loc2_ in this.tokens)
      {
         if(this.tokens[_loc2_] is _1eo)
         {
            _loc3_ = _1eo(this.tokens[_loc2_]);
            _loc3_._0L_b(param1);
            _loc5_ = _loc5_.replace("{" + _loc2_ + "}",_loc3_.getString());
         }
         else
         {
            _loc4_ = this.tokens[_loc2_];
            if(_loc4_.length > 0 && _loc4_.charAt(0) == "{" && _loc4_.charAt(_loc4_.length - 1) == "}")
            {
               _loc4_ = param1.getValue(_loc4_.substr(1,_loc4_.length - 2));
            }
            _loc5_ = _loc5_.replace("{" + _loc2_ + "}",_loc4_);
         }
      }
      _loc5_ = _loc5_.replace(/\\n/g,"\n");
      return _loc5_.concat(this.closingHTMLTags);
   }
}
