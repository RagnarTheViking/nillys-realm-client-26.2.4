package com.company.assembleegameclient.map
{
   import com.company.assembleegameclient.objects._sV_;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import com.company.assembleegameclient.objects.Portrait;
   
   public class _71
   {
       
      
      public var type_:int;
      
      public var id_:String;
      
      public var noWalk_:Boolean = true;
      
      public var minDamage_:int = 0;
      
      public var maxDamage_:int = 0;
      
      public var animate_:com.company.assembleegameclient.map.GroundAnimation;
      
      public var _M_m:int = -1;
      
      public var _15W_:int = 0;
      
      public var speed_:Number = 1;
      
      public var xOffset_:Number = 0;
      
      public var yOffset_:Number = 0;
      
      public var push_:Boolean = false;
      
      public var sink_:Boolean = false;
      
      public var sinking_:Boolean = false;
      
      public var randomOffset_:Boolean = false;
      
      public var hasEdge:Boolean = false;
      
      private var _1G_A_:_sV_ = null;
      
      private var _1S_5:_sV_ = null;
      
      private var _1Y_Q_:_sV_ = null;
      
      private var _hE_:Vector.<BitmapData> = null;
      
      private var _1Q_X_:Vector.<BitmapData> = null;
      
      public var _yD_:Boolean = false;
      
      public var _kK_:_sV_ = null;
      
      public var _sd:com.company.assembleegameclient.map.GroundAnimation = null;
      
      public function _71(param1:XML)
      {
         this.animate_ = new com.company.assembleegameclient.map.GroundAnimation();
         super();
         this.type_ = int(param1.@type);
         this.id_ = String(param1.@id);
         this.noWalk_ = param1.hasOwnProperty("NoWalk");
         if(param1.hasOwnProperty("MinDamage"))
         {
            this.minDamage_ = int(param1.MinDamage);
         }
         if(param1.hasOwnProperty("MaxDamage"))
         {
            this.maxDamage_ = int(param1.MaxDamage);
         }
         this.push_ = param1.hasOwnProperty("Push");
         if(param1.hasOwnProperty("Animate"))
         {
            this.animate_._pO_(XML(param1.Animate));
         }
         if(param1.hasOwnProperty("BlendPriority"))
         {
            this._M_m = int(param1.BlendPriority);
         }
         if(param1.hasOwnProperty("CompositePriority"))
         {
            this._15W_ = int(param1.CompositePriority);
         }
         if(param1.hasOwnProperty("Speed"))
         {
            this.speed_ = Number(param1.Speed);
         }
         this.xOffset_ = !!param1.hasOwnProperty("XOffset")?Number(Number(param1.XOffset)):Number(0);
         this.yOffset_ = !!param1.hasOwnProperty("YOffset")?Number(Number(param1.YOffset)):Number(0);
         this.push_ = param1.hasOwnProperty("Push");
         this.sink_ = param1.hasOwnProperty("Sink");
         this.sinking_ = param1.hasOwnProperty("Sinking");
         this.randomOffset_ = param1.hasOwnProperty("RandomOffset");
         if(param1.hasOwnProperty("Edge"))
         {
            this.hasEdge = true;
            this._1G_A_ = new Portrait(XML(param1.Edge));
            if(param1.hasOwnProperty("Corner"))
            {
               this._1S_5 = new Portrait(XML(param1.Corner));
            }
            if(param1.hasOwnProperty("InnerCorner"))
            {
               this._1Y_Q_ = new Portrait(XML(param1.InnerCorner));
            }
         }
         this._yD_ = param1.hasOwnProperty("SameTypeEdgeMode");
         if(param1.hasOwnProperty("Top"))
         {
            this._kK_ = new Portrait(XML(param1.Top));
            this._sd = new com.company.assembleegameclient.map.GroundAnimation();
            if(param1.hasOwnProperty("TopAnimate"))
            {
               this._sd._pO_(XML(param1.TopAnimate));
            }
         }
      }
      
      public function _18j() : Vector.<BitmapData>
      {
         if(!this.hasEdge || this._hE_ != null)
         {
            return this._hE_;
         }
         this._hE_ = new Vector.<BitmapData>(9);
         this._hE_[3] = this._1G_A_.getTexture(0);
         this._hE_[1] = BitmapUtil._P_U_(this._hE_[3],1);
         this._hE_[5] = BitmapUtil._P_U_(this._hE_[3],2);
         this._hE_[7] = BitmapUtil._P_U_(this._hE_[3],3);
         if(this._1S_5 != null)
         {
            this._hE_[0] = this._1S_5.getTexture(0);
            this._hE_[2] = BitmapUtil._P_U_(this._hE_[0],1);
            this._hE_[8] = BitmapUtil._P_U_(this._hE_[0],2);
            this._hE_[6] = BitmapUtil._P_U_(this._hE_[0],3);
         }
         return this._hE_;
      }
      
      public function _09E_() : Vector.<BitmapData>
      {
         if(this._1Y_Q_ == null || this._1Q_X_ != null)
         {
            return this._1Q_X_;
         }
         this._1Q_X_ = this._hE_.concat();
         this._1Q_X_[0] = this._1Y_Q_.getTexture(0);
         this._1Q_X_[2] = BitmapUtil._P_U_(this._1Q_X_[0],1);
         this._1Q_X_[8] = BitmapUtil._P_U_(this._1Q_X_[0],2);
         this._1Q_X_[6] = BitmapUtil._P_U_(this._1Q_X_[0],3);
         return this._1Q_X_;
      }
   }
}
