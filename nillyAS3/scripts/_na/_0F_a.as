package _na
{
   import _0E_T_._1zi;
   import kabam.rotmg.assets.services._0pW_;
   import _04h._1Q_v;
   import _04h._083;
   import _1F_z._1Z_D_;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import com.company.util.ConversionUtil;
   
   public class _0F_a
   {
       
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var factory:_0pW_;
      
      [Inject]
      public var _1A_A_:_1Q_v;
      
      public function _0F_a()
      {
         super();
      }
      
      public function _1yi(param1:XMLList) : Vector.<_083>
      {
         var _loc2_:XML = null;
         var _loc3_:Vector.<_083> = new Vector.<_083>();
         var _loc4_:int = 1;
         for each(_loc2_ in param1)
         {
            _loc3_.push(this._1__P_(_loc2_,_loc4_));
            _loc4_++;
         }
         _loc3_ = this._1P_B_(_loc3_);
         return this._1ok(_loc3_);
      }
      
      private function _1ok(param1:Vector.<_083>) : Vector.<_083>
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:_083 = null;
         var _loc5_:Vector.<_083> = new Vector.<_083>();
         if(this._1A_A_._0S_y())
         {
            _loc2_ = false;
            _loc3_ = false;
            for each(_loc4_ in param1)
            {
               if(!_loc2_ && this._1A_A_._0P_9._0dV_(_loc4_))
               {
                  this._1A_A_._0P_9.rank = _loc4_.rank;
                  _loc5_.push(this._1A_A_._0P_9);
                  _loc2_ = true;
               }
               if(_loc4_._0I_p)
               {
                  _loc3_ = true;
               }
               if(_loc2_)
               {
                  _loc4_.rank++;
               }
               _loc5_.push(_loc4_);
            }
            if(_loc5_.length < 20 && !_loc2_ && !_loc3_)
            {
               this._1A_A_._0P_9.rank = _loc5_.length + 1;
               _loc5_.push(this._1A_A_._0P_9);
            }
         }
         return _loc5_.length > 0?_loc5_:param1;
      }
      
      private function _1P_B_(param1:Vector.<_083>) : Vector.<_083>
      {
         var _loc2_:Boolean = false;
         var _loc3_:_083 = null;
         var _loc4_:_083 = null;
         var _loc5_:int = -1;
         if(this._1A_A_._0S_y())
         {
            _loc2_ = false;
            _loc3_ = this._1A_A_._0P_9;
            for each(_loc4_ in param1)
            {
               if(_loc4_._0I_p && _loc3_._0dV_(_loc4_))
               {
                  _loc5_ = _loc4_.rank - 1;
                  _loc2_ = true;
               }
               else if(_loc2_)
               {
                  _loc4_.rank--;
               }
            }
         }
         if(_loc5_ != -1)
         {
            param1.splice(_loc5_,1);
         }
         return param1;
      }
      
      private function _1__P_(param1:XML, param2:int) : _083
      {
         var _loc3_:_1Z_D_ = null;
         var _loc4_:XML = null;
         var _loc5_:_083 = new _083();
         _loc5_._0I_p = param1.hasOwnProperty("IsPersonalRecord");
         _loc5_.arenaTime = param1.Time;
         _loc5_.name = param1.PlayData.CharacterData.Name;
         _loc5_.rank = !!param1.hasOwnProperty("Rank")?int(param1.Rank):int(param2);
         var _loc6_:int = param1.PlayData.CharacterData.Texture;
         var _loc7_:int = param1.PlayData.CharacterData.Class;
         var _loc8_:_0ih = this._0ta._0B_M_(_loc7_);
         var _loc9_:_Y_F_ = _loc8_._E_G_._nV_(_loc6_);
         var _loc10_:int = !!param1.PlayData.CharacterData.hasOwnProperty("Tex1")?int(param1.PlayData.CharacterData.Tex1):0;
         var _loc11_:int = !!param1.PlayData.CharacterData.hasOwnProperty("Tex2")?int(param1.PlayData.CharacterData.Tex2):0;
         _loc5_._each = this.factory.makeIcon(_loc9_._0C_3,100,_loc10_,_loc11_);
         _loc5_._W_V_ = ConversionUtil._1b5(param1.PlayData.CharacterData.Inventory);
         _loc5_._bT_ = _loc8_._bT_;
         _loc5_.guildName = param1.PlayData.CharacterData.GuildName;
         _loc5_._17I_ = param1.PlayData.CharacterData.GuildRank;
         _loc5_.arenaWave = param1.WaveNumber;
         if(param1.PlayData.hasOwnProperty("Pet"))
         {
            _loc3_ = new _1Z_D_();
            _loc4_ = new XML(param1.PlayData.Pet);
            _loc3_.apply(_loc4_);
            _loc5_.pet = _loc3_;
         }
         return _loc5_;
      }
   }
}
