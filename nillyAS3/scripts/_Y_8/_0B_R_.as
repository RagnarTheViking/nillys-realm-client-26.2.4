package _Y_8
{
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1gF_._0ke;
   import _05L_._05T_;
   import _C_._0C_J_;
   import com.company.assembleegameclient.util._A_o;
   import _05L_.ChatMessage;
   import flash.display.DisplayObject;
   import com.company.assembleegameclient.util.Star;
   import flash.display.BitmapData;
   import _1xa.SText;
   import flash.display.Bitmap;
   import _1xa._1eo;
   import emotes.Emotes;
   import flash.display.StageQuality;
   
   public class _0B_R_
   {
      
      private static const _0L_P_:Matrix = new Matrix();
      
      private static const INFO:String = Parameters.InfoText;
      
      private static const CLIENT:String = Parameters.ClientText;
      
      private static const HELP:String = Parameters.HelpText;
      
      private static const ERROR:String = Parameters.ErrorText;
      
      private static const GUILD:String = Parameters.GuildText;
      
      private static const tField:TextField = _J_R_();
       
      
      [Inject]
      public var factory:_0ke;
      
      [Inject]
      public var model:_05T_;
      
      [Inject]
      public var _nJ_:_0C_J_;
      
      [Inject]
      public var _1gH_:_A_o;
      
      private var message:ChatMessage;
      
      private var buffer:Vector.<DisplayObject>;
      
      public function _0B_R_()
      {
         super();
      }
      
      private static function _J_R_() : TextField
      {
         var _loc1_:TextField = new TextField();
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.size = 14;
         _loc2_.bold = true;
         _loc1_.defaultTextFormat = _loc2_;
         return _loc1_;
      }
      
      public function make(param1:ChatMessage, param2:Boolean = false) : _nn
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         this.message = param1;
         this.buffer = new Vector.<DisplayObject>();
         this.setFont(tField);
         this.setStar();
         this.setDirectedTell();
         this.setNameTag();
         this.setText();
         var _loc6_:Boolean = param1.numStars == -1 || param1.objectId == -1;
         var _loc8_:String = param1.name;
         if(_loc6_ && !this.isInfoType() && (_loc3_ = param1.text.search("/trade ")) != -1)
         {
            _loc3_ = _loc3_ + 7;
            _loc4_ = "";
            _loc5_ = _loc3_;
            while(_loc5_ < _loc3_ + 10)
            {
               if(param1.text.charAt(_loc5_) == "\"")
               {
                  break;
               }
               _loc4_ = _loc4_ + param1.text.charAt(_loc5_);
               _loc5_++;
            }
            _loc8_ = _loc4_;
            _loc7_ = true;
         }
         return new _nn(this.buffer,this.model.chat.width,this.model._A_x,param2,param1.objectId,_loc8_,param1.recipientName == GUILD,_loc7_);
      }
      
      private function setStar() : void
      {
         var _loc1_:int = this.message.numStars;
         var _loc2_:Boolean = this.message.admin;
         if(_loc1_ >= 0 || _loc2_)
         {
            this.buffer.push(Star.getPlayerRankIcon(_loc1_,_loc2_));
         }
      }
      
      private function setDirectedTell() : void
      {
         var _loc1_:BitmapData = null;
         if(this.message.isTell && !this.message.isTell2Me)
         {
            _loc1_ = this.getBitmapData(new SText("To: "),61695);
            this.buffer.push(new Bitmap(_loc1_));
         }
      }
      
      private function setNameTag() : void
      {
         if(!this.isInfoType())
         {
            this.buildNameTag();
         }
      }
      
      private function isInfoType() : Boolean
      {
         var _loc1_:String = this.message.name;
         return _loc1_ == INFO || _loc1_ == CLIENT || _loc1_ == HELP || _loc1_ == ERROR || _loc1_ == GUILD;
      }
      
      private function buildNameTag() : void
      {
         var _loc1_:_1eo = new SText(this.getChatNameTag());
         var _loc2_:BitmapData = this.getBitmapData(_loc1_,this.getNameColor());
         this.buffer.push(new Bitmap(_loc2_));
      }
      
      private function getChatNameTag() : String
      {
         var _loc1_:String = this.message.isTell && !this.message.isTell2Me?this.message.recipientName:this.message.name;
         if(_loc1_.charAt(0) == "#" || _loc1_.charAt(0) == "@")
         {
            _loc1_ = _loc1_.substr(1);
         }
         return "<" + _loc1_ + ">";
      }
      
      private function setText() : void
      {
         if(this.message.text != null && this.message.text != "")
         {
            this._0F_h(this.message.text,true);
         }
      }
      
      private function _0F_h(param1:String, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:int = 0;
         var _loc8_:uint = 0;
         var _loc9_:int = 0;
         var _loc3_:String = param1;
         if(param2)
         {
            for each(_loc6_ in this.buffer)
            {
               _loc4_ = _loc4_ + _loc6_.width;
            }
            _loc5_ = _loc3_.length;
            tField.text = _loc3_;
            while(tField.textWidth >= this.model.chat.width - _loc4_)
            {
               _loc5_ = _loc5_ - 10;
               tField.text = _loc3_.substr(0,_loc5_);
            }
            if(_loc5_ < _loc3_.length)
            {
               _loc7_ = _loc3_.substr(0,_loc5_).lastIndexOf(" ");
               _loc5_ = _loc7_ == 0 || _loc7_ == -1?int(_loc5_):int(_loc7_);
            }
            this.add(_loc3_.substr(0,_loc5_));
         }
         if(_loc5_ < _loc3_.length)
         {
            _loc8_ = _loc3_.length - _loc5_;
            while(_loc5_ < _loc3_.length)
            {
               tField.text = _loc3_.substr(_loc5_,_loc8_);
               while(tField.textWidth >= this.model.chat.width)
               {
                  _loc8_ = _loc8_ - 10;
                  tField.text = _loc3_.substr(_loc5_,_loc8_);
               }
               _loc9_ = _loc8_;
               if(_loc3_.length > _loc5_ + _loc8_)
               {
                  _loc9_ = _loc3_.substr(_loc5_,_loc8_).lastIndexOf(" ");
                  _loc9_ = _loc9_ == 0 || _loc9_ == -1?int(_loc8_):int(_loc9_);
               }
               this.add(_loc3_.substr(_loc5_,_loc9_));
               _loc5_ = _loc5_ + _loc9_;
            }
         }
      }
      
      private function containsEmotes(param1:String) : Boolean
      {
         var _loc3_:String = null;
         var _loc2_:Array = param1.split(" ");
         for each(_loc3_ in _loc2_)
         {
            if(Emotes.hasEmote(_loc3_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function getAllWords(param1:String) : Array
      {
         return param1.split(" ");
      }
      
      private function add(param1:String) : void
      {
         var _loc2_:_1eo = null;
         var _loc3_:BitmapData = null;
         var _loc4_:String = null;
         if(this.containsEmotes(param1))
         {
            for each(_loc4_ in this.getAllWords(param1))
            {
               if(Emotes.hasEmote(_loc4_))
               {
                  this.buffer.push(Emotes.getEmote(_loc4_));
               }
               else
               {
                  _loc2_ = new SText(_loc4_);
                  _loc3_ = this.getBitmapData(_loc2_,this.getTextColor());
                  this.buffer.push(new Bitmap(_loc3_));
               }
            }
            return;
         }
         _loc2_ = new SText(param1);
         _loc3_ = this.getBitmapData(_loc2_,this.getTextColor());
         this.buffer.push(new Bitmap(_loc3_));
      }
      
      private function getNameColor() : uint
      {
         if(this.message.nameColor != 1193046)
         {
            return this.message.nameColor;
         }
         if(this.message.name.charAt(0) == "#")
         {
            return 16754688;
         }
         if(this.message.name.charAt(0) == "@")
         {
            return 16776960;
         }
         if(this.message.recipientName == GUILD)
         {
            return 10944349;
         }
         if(this.message.recipientName != "")
         {
            return 61695;
         }
         return 65280;
      }
      
      private function getTextColor() : uint
      {
         if(this.message.textColor != 1193046)
         {
            return this.message.textColor;
         }
         var _loc1_:String = this.message.name;
         if(_loc1_ == INFO)
         {
            return 16776960;
         }
         if(_loc1_ == CLIENT)
         {
            return 255;
         }
         if(_loc1_ == HELP)
         {
            return 16734981;
         }
         if(_loc1_ == ERROR)
         {
            return 16711680;
         }
         if(_loc1_.charAt(0) == "@")
         {
            return 16776960;
         }
         if(this.message.recipientName == GUILD)
         {
            return 10944349;
         }
         if(this.message.recipientName != "")
         {
            return 61695;
         }
         return 16777215;
      }
      
      private function getBitmapData(param1:_1eo, param2:uint) : BitmapData
      {
         if(!Parameters.data_["forceChatQuality"])
         {
            return this.factory.make(param1,14,param2,true,_0L_P_,true);
         }
         var _loc3_:String = this._1gH_._1M_();
         this._1gH_._0T_u(StageQuality.HIGH);
         var _loc4_:BitmapData = this.factory.make(param1,14,param2,true,_0L_P_,true);
         this._1gH_._0T_u(_loc3_);
         return _loc4_;
      }
      
      private function setFont(param1:TextField) : void
      {
         param1.embedFonts = true;
         var _loc2_:TextFormat = param1.getTextFormat();
         _loc2_.font = this._nJ_._7X_().getName();
         param1.defaultTextFormat = _loc2_;
      }
   }
}
