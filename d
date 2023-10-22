//*************Shortest path in Undirected Graph having unit distance*************
vector<int> shortestPath(vector<vector<int>>& edges, int N,int M, int src){
        // array of vector
        vector<int>adj[N];
        
        for(int i=0;i<M;i++){
            adj[edges[i][0]].push_back(edges[i][1]);
            adj[edges[i][1]].push_back(edges[i][0]);
        }
        //N size of vector
        vector<int>dist(N,-1);
        //return vector distance
        // for(int i=0;i<N;i++){
        //     dist[i]=-1;
        // }
        
        dist[src]=0;
        
        //Node + dist
        queue<pair<int,int>>q;
        q.push({src,0});
        
        int i,step;
        while(!q.empty()){
            i=q.front().first;
            step=q.front().second;
            q.pop();
            for(int k=0;k<adj[i].size();k++){
                //if adjacent not visit
                if(dist[adj[i][k]]==-1){
                    q.push({adj[i][k],step+1});
                    dist[adj[i][k]]=step+1;
                }
            }
            
        }
        return dist;
    }


//*********************Implementing Dijkstra Algorithm***************


 vector <int> dijkstra(int V, vector<vector<int>> adj[], int src)
    {
        // Code here
        vector<int>dist(V);
        for(int i=0;i<V;i++){
            dist[i]=-1;
        }
        
        priority_queue<pair<int,int>,vector<pair<int,int>>,greater<pair<int,int>>>q;
        
        
        //priority queue work according minimum value
        //first weight/dist,second=node
        
        q.push({0,src});
        int step,node;
        while(!q.empty()){
            step=q.top().first;
            node=q.top().second;
            
            q.pop();
            
            //not equal to -1
            if(dist[node]!=-1)
            continue;
            //not equal to -1
            dist[node]=step;
            for(int j=0;j<adj[node].size();j++){
                if(dist[adj[node][j][0]]==-1){
                    //first step(distance) and second Node(number)
                    q.push({step+adj[node][j][1],adj[node][j][0]});
                }
            }
        }
        return dist;
    }
